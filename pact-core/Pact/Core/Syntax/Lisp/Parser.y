{
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE LambdaCase #-}

module Pact.Core.Syntax.Lisp.Parser where

import Control.Lens(preview, view, _head)
import Control.Monad.Except

import Data.Decimal(DecimalRaw(..))
import Data.Char(digitToInt)
import Data.Text(Text)
import Data.List.NonEmpty(NonEmpty(..))

import qualified Data.Map.Strict as Map
import qualified Data.Text as T
import qualified Data.Text.Read as T
import qualified Data.List.NonEmpty as NE

import Pact.Core.Names
import Pact.Core.Info
import Pact.Core.Literal
import Pact.Core.Builtin
import Pact.Core.Type(PrimType(..))
import Pact.Core.Guards
import Pact.Core.Imports
import Pact.Core.Errors
import Pact.Core.Syntax.Lisp.ParseTree
import Pact.Core.Syntax.Lisp.LexUtils


}
%name parseExpr Expr
%name parseModule Module
%name parseReplProgram ReplProgram
%name parseProgram Program

%tokentype { PosToken }
%monad { ParserT }

%errorhandlertype explist
%error { parseError }


%token
  let        { PosToken TokenLet _ }
  if         { PosToken TokenIf _ }
  lam        { PosToken TokenLambda _ }
  module     { PosToken TokenModule _ }
  interface  { PosToken TokenInterface _ }
  import     { PosToken TokenImport _ }
  keygov     { PosToken TokenKeyGov _ }
  capgov     { PosToken TokenCapGov _ }
  defun      { PosToken TokenDefun _ }
  defcap     { PosToken TokenDefCap _ }
  defconst   { PosToken TokenDefConst _ }
  defschema  { PosToken TokenDefSchema _ }
  deftable   { PosToken TokenDefTable _ }
  defpact    { PosToken TokenDefPact _ }
  defprop    { PosToken TokenDefProperty _}
  bless      { PosToken TokenBless _}
  implements { PosToken TokenImplements _ }
  true       { PosToken TokenTrue _ }
  false      { PosToken TokenFalse _ }
  progn      { PosToken TokenBlockIntro _ }
  err        { PosToken TokenError _ }
  try        { PosToken TokenTry _ }
  suspend    { PosToken TokenSuspend _ }
  load       { PosToken TokenLoad _ }
  docAnn     { PosToken TokenDocAnn _ }
  modelAnn   { PosToken TokenModelAnn _ }
  eventAnn   { PosToken TokenEventAnn _ }
  managedAnn { PosToken TokenManagedAnn _ }
  step       { PosToken TokenStep _ }
  steprb     { PosToken TokenStepWithRollback _ }
  tc         { PosToken TokenTypechecks _ }
  tcfail     { PosToken TokenTypecheckFailure _ }
  '{'        { PosToken TokenOpenBrace _ }
  '}'        { PosToken TokenCloseBrace _ }
  '('        { PosToken TokenOpenParens _ }
  ')'        { PosToken TokenCloseParens _ }
  '['        { PosToken TokenOpenBracket _ }
  ']'        { PosToken TokenCloseBracket _ }
  ','        { PosToken TokenComma _ }
  '::'       { PosToken TokenDynAcc _ }
  ':'        { PosToken TokenColon _ }
  ':='       { PosToken TokenBindAssign _ }
  '.'        { PosToken TokenDot _ }
  -- types
  TYTABLE    { PosToken TokenTyTable _ }
  -- TYINTEGER  { PosToken TokenTyInteger _ }
  -- TYDECIMAL  { PosToken TokenTyDecimal _ }
  -- TYSTRING   { PosToken TokenTyString _ }
  -- TYBOOL     { PosToken TokenTyBool _ }
  -- TYUNIT     { PosToken TokenTyUnit _ }
  TYOBJECT   { PosToken TokenTyObject _}
  -- TYLIST     { PosToken TokenTyList _ }
  -- TYGUARD    { PosToken TokenTyGuard _ }
  -- TYKEYSET   { PosToken TokenTyKeyset _}

  '->'       { PosToken TokenTyArrow _ }
  '=='       { PosToken TokenEq _ }
  '!='       { PosToken TokenNeq _ }
  '>'        { PosToken TokenGT _ }
  '>='       { PosToken TokenGEQ _ }
  '<'        { PosToken TokenLT _ }
  '<='       { PosToken TokenLEQ _ }
  '+'        { PosToken TokenPlus _ }
  '-'        { PosToken TokenMinus _}
  '*'        { PosToken TokenMult _ }
  '/'        { PosToken TokenDiv _ }
  '&'        { PosToken TokenBitAnd _ }
  '|'        { PosToken TokenBitOr _ }
  '~'        { PosToken TokenBitComplement _}
  pow        { PosToken TokenPow _}
  and        { PosToken TokenAnd _ }
  or         { PosToken TokenOr _ }
  IDENT      { PosToken (TokenIdent _) _ }
  NUM        { PosToken (TokenNumber _) _ }
  STR        { PosToken (TokenString _) _ }
  TICK       { PosToken (TokenSingleTick _) _}

%%

Program :: { [ParsedTopLevel] }
  : ProgramList { reverse $1 }

ProgramList :: { [ParsedTopLevel] }
  : ProgramList TopLevel { $2:$1 }
  | {- empty -} { [] }

ReplProgram :: { [ReplSpecialTL LineInfo] }
  : ReplProgramList { reverse $1 }

ReplProgramList :: { [ReplSpecialTL LineInfo] }
  : ReplProgramList RTL { $2:$1 }
  | {- empty -} { [] }

TopLevel :: { ParsedTopLevel }
  : Module { TLModule $1 }
  | Interface { TLInterface $1 }
  | Expr { TLTerm $1 }

RTL :: { ReplSpecialTL LineInfo }
  : ReplTopLevel { RTL $1 }
  | '(' ReplSpecial ')' { RTLReplSpecial  ($2 (combineSpan (_ptInfo $1) (_ptInfo $3))) }

ReplTopLevel :: { ParsedReplTopLevel }
  : Module { RTLModule $1 }
  | Interface { RTLInterface $1 }
  | '(' Defun ')' { RTLDefun ($2 (combineSpan (_ptInfo $1) (_ptInfo $3))) }
  | '(' DefConst ')' { RTLDefConst ($2 (combineSpan (_ptInfo $1) (_ptInfo $3))) }
  | Expr { RTLTerm $1 }


ReplSpecial :: { LineInfo -> ReplSpecialForm LineInfo }
  : load STR BOOLEAN { ReplLoad (getStr $2) $3 }
  | load STR { ReplLoad (getStr $2) False }
  | tc STR Expr { ReplTypechecks (getStr $2) $3 }
  | tcfail STR Expr { ReplTypecheckFail (getStr $2) $3 }

Governance :: { Governance Text }
  : StringRaw { Governance (Left (KeySetName $1))}
  | IDENT { Governance (Right (getIdent $1))}

StringRaw :: { Text }
 : STR  { getStr $1 }
 | TICK { getTick $1 }

Module :: { ParsedModule }
  : '(' module IDENT Governance MDocOrModuleModel Exts Defs ')'
    { Module (ModuleName (getIdent $3) Nothing) $4 (reverse $6) (NE.fromList (reverse $7)) (fst $5) (snd $5)}

Interface :: { ParsedInterface }
  : '(' interface IDENT MDocOrModel IfDefs ')'
    { Interface (ModuleName (getIdent $3) Nothing) (reverse $5) (fst $4) (snd $4) }

MDocOrModuleModel :: { (Maybe Text, [DefProperty LineInfo])}
  : DocAnn ModuleModel { (Just $1, $2)}
  | ModuleModel DocAnn { (Just $2, $1) }
  | DocAnn { (Just $1, [])}
  | ModuleModel { (Nothing, $1)}
  | DocStr { (Just $1, []) }
  | {- empty -} { (Nothing, []) }


ModuleModel :: { [DefProperty LineInfo] }
  : modelAnn '[' DefProperties ']' { reverse $3 }

DefProperties :: { [DefProperty LineInfo] }
  : DefProperties DefProperty { $2:$1 }
  | {- empty -} { [] }

DefProperty :: { DefProperty LineInfo }
  : '(' defprop IDENT '(' MArgs ')' Block ')' { DefProperty (getIdent $3) (reverse $5) $7 }
  | '(' defprop IDENT Block ')' { DefProperty (getIdent $3) [] $4 }


-- Module :: { ParsedModule }
--   : '(' module IDENT '(' Gov ')' Exts Defs ')'
--     { Module (ModuleName (getIdent $3) Nothing) $5 (reverse $7) (NE.fromList (reverse $8)) }

Gov :: { Governance Text }
  : keygov STR { Governance (Left (KeySetName (getStr $2))) }
  | capgov IDENT { Governance (Right (getIdent $2)) }

Exts :: { [ExtDecl] }
  : Exts Ext { $2:$1 }
  | {- empty -} { [] }

Ext :: { ExtDecl }
  : '(' import ModQual ImportList ')' { ExtImport (Import (mkModName $3) Nothing $4)  }
  | '(' implements ModQual ')' { ExtImplements (mkModName $3) }
  | '(' bless StringRaw ')' { ExtBless $3 }

Defs :: { [ParsedDef] }
  : Defs Def { $2:$1 }
  | Def { [$1] }

Def :: { ParsedDef }
  : '(' Defun ')' { Dfun ($2 (combineSpan (_ptInfo $1) (_ptInfo $3))) }
  | '(' DefConst ')' { DConst ($2 (combineSpan (_ptInfo $1) (_ptInfo $3))) }
  | '(' Defcap ')'  { DCap ($2 (combineSpan (_ptInfo $1) (_ptInfo $3)))  }
  | '(' Defschema ')' { DSchema ($2 (combineSpan (_ptInfo $1) (_ptInfo $3)))  }
  | '(' Deftable ')' { DTable ($2 (combineSpan (_ptInfo $1) (_ptInfo $3))) }
  | '(' DefPact ')' { DPact ($2 (combineSpan (_ptInfo $1) (_ptInfo $3))) }


IfDefs :: { [ParsedIfDef] }
  : IfDefs IfDef { $2:$1 }
  | IfDef { [$1] }

IfDef :: { ParsedIfDef }
  : '(' IfDefun ')' { IfDfun ($2 (combineSpan (_ptInfo $1) (_ptInfo $3))) }
  | '(' DefConst ')' { IfDConst ($2 (combineSpan (_ptInfo $1) (_ptInfo $3))) }

-- ident = $2,
IfDefun :: { LineInfo -> IfDefun LineInfo }
  : defun IDENT ':' Type '(' ArgList ')' MDocOrModel
    { IfDefun (getIdent $2) (reverse $6) $4 (fst $8) (snd $8) }

IfDefCap :: { LineInfo -> IfDefCap LineInfo }
  : defcap IDENT ':' Type '(' ArgList ')' MDocOrModel
    { IfDefCap (getIdent $2) (reverse $6) $4 (fst $8) (snd $8) }

IfDefPact :: { LineInfo -> IfDefPact LineInfo }
  : defpact IDENT ':' Type '(' ArgList ')' MDocOrModel
    { IfDefPact (getIdent $2) (reverse $6) $4 (fst $8) (snd $8) }

ImportList :: { Maybe [Text] }
  : '[' ImportNames ']' { Just (reverse $2) }
  | {- empty -} { Nothing }

ImportNames :: { [Text] }
  : ImportNames IDENT { (getIdent $2):$1 }
  | {- empty -} { [] }

DefConst :: { LineInfo -> ParsedDefConst }
  : defconst IDENT MTypeAnn Expr MDoc { DefConst (getIdent $2) $3 $4 $5 }

-- All defs
Defun :: { LineInfo -> ParsedDefun }
  : defun IDENT MTypeAnn '(' MArgs ')' MDocOrModel Block
    { Defun (getIdent $2) (reverse $5) $3 $8 (fst $7) (snd $7) }

Defschema :: { LineInfo -> DefSchema LineInfo }
  : defschema IDENT MDocOrModel NEArgList
    { DefSchema (getIdent $2) (reverse $4) (fst $3) (snd $3) }

Deftable :: { LineInfo -> DefTable LineInfo }
  : deftable IDENT ':' '{' ParsedName '}' MDoc { DefTable (getIdent $2) $5 $7 }

Defcap :: { LineInfo -> DefCap LineInfo }
  : defcap IDENT MTypeAnn '(' MArgs ')' MDocOrModel MDCapMeta Block
    { DefCap (getIdent $2) (reverse $5) $3 $9 (fst $7) (snd $7) $8 }

DefPact :: { LineInfo -> DefPact LineInfo }
  : defpact IDENT MTypeAnn '(' MArgs ')' MDocOrModel Steps
    { DefPact (getIdent $2) $5 $3 $8 (fst $7) (snd $7) }

Steps :: { [PactStep LineInfo] }
  : Steps Step { $2:$1 }
  | Step { [$1] }

Step :: { PactStep LineInfo }
  : '(' step Expr MModel ')' { Step $3 $4 }
  | '(' steprb Expr Expr MModel ')' { StepWithRollback $3 $4 $5 }

MDCapMeta :: { Maybe DCapMeta }
  : Managed { Just $1 }
  | Event { Just $1 }
  | {- empty -} { Nothing }

Managed :: { DCapMeta }
  : managedAnn { DefManaged Nothing }
  | managedAnn IDENT ParsedName { DefManaged (Just (getIdent $2, $3)) }

Event :: { DCapMeta }
  : eventAnn { DefEvent }

MArgs :: { [MArg] }
  : MArgs IDENT ':' Type { (MArg (getIdent $2) (Just $4)):$1 }
  | MArgs IDENT {  (MArg (getIdent $2) Nothing):$1 }
  | {- empty -} { [] }

NEArgList :: { [Arg] }
  : ArgList IDENT ':' Type { (Arg (getIdent $2) $4):$1 }

ArgList :: { [Arg] }
  : ArgList IDENT ':' Type { (Arg (getIdent $2) $4):$1 }
  | {- empty -} { [] }

Type :: { Type }
  : '[' Type ']' { TyList $2 }
  | module '{' ModQual '}' { TyModRef (mkModName $3) }
  -- | TYGUARD { TyGuard }
  | TYOBJECT '{' ParsedName '}' { TyObject $3 }
  | TYOBJECT { TyPolyObject }
  -- | TYKEYSET { TyKeyset }
  -- | TYLIST { TyPolyList }
  | AtomicType { $1 }

AtomicType :: { Type }
  : IDENT {% primType (_ptInfo $1) (getIdent $1) }
  -- : PrimType { TyPrim $1 }

TyFieldPair :: { (Field, Type) }
  : IDENT ':' Type { (Field (getIdent $1), $3) }

RowType :: { [(Field, Type)] }
  : RowType ',' TyFieldPair { $3:$1 }
  | TyFieldPair { [$1] }
  | {- empty -} { [] }

-- PrimType :: { PrimType }
--   : TYINTEGER { PrimInt }
--   | TYDECIMAL { PrimDecimal }
--   | TYSTRING  { PrimString }
--   | TYUNIT    { PrimUnit }
--   | TYBOOL    { PrimBool }

-- Annotations
DocAnn :: { Text }
  : docAnn STR { getStr $2 }

DocStr :: { Text }
  : STR { getStr $1 }

ModelExprs :: { [ParsedExpr] }
  : ModelExprs Expr { $2:$1 }
  | {- empty -} { [] }

MModel :: { Maybe [Expr LineInfo] }
  : ModelAnn { Just $1 }
  | {- empty -}  { Nothing }

ModelAnn :: { [Expr LineInfo] }
  : modelAnn '[' ModelExprs ']' { reverse $3 }

MDocOrModel :: { (Maybe Text, Maybe [Expr LineInfo])}
  : DocAnn ModelAnn { (Just $1, Just $2)}
  | ModelAnn DocAnn { (Just $2, Just $1) }
  | DocAnn { (Just $1, Nothing)}
  | ModelAnn { (Nothing, Just $1)}
  | DocStr { (Just $1, Nothing) }
  | {- empty -} { (Nothing, Nothing) }

MDoc :: { Maybe Text }
  : DocAnn { Just $1 }
  | DocStr { Just $1 }
  | {- empty -} { Nothing }

MTypeAnn :: { Maybe Type }
  : ':' Type { Just $2 }
  | {- empty -} { Nothing }

Block :: { ParsedExpr }
  : BlockBody { mkBlock (reverse $1)  }

BlockBody :: { [ParsedExpr] }
  : BlockBody Expr { $2:$1 }
  | Expr { [$1] }

Expr :: { ParsedExpr }
  : '(' SExpr ')' { $2 (combineSpan (_ptInfo $1) (_ptInfo $3)) }
  | Atom { $1 }
  | Expr '::' IDENT { DynAccess $1 (getIdent $3) (combineSpan (view termInfo $1) (_ptInfo $3)) }

SExpr :: { LineInfo -> ParsedExpr }
  : LamExpr { $1 }
  | LetExpr { $1 }
  | IfExpr { $1 }
  | TryExpr { $1 }
  | ErrExpr { $1 }
  | ProgNExpr { $1 }
  | GenAppExpr { $1 }
  | SuspendExpr { $1 }

List :: { ParsedExpr }
  : '[' ListExprs ']' { List $2 (_ptInfo $1) }

ListExprs :: { [ParsedExpr] }
  : Expr MCommaExpr { $1:(reverse $2) }
  | {- empty -} { [] }

MCommaExpr :: { [ParsedExpr] }
  : ',' ExprCommaSep { $2 }
  | AppList { $1 }

ExprCommaSep :: { [ParsedExpr] }
  : ExprCommaSep ',' Expr { $3:$1 }
  | Expr { [$1] }
  -- | {- empty -} { [] }

LamExpr :: { LineInfo -> ParsedExpr }
  : lam '(' LamArgs ')' Expr { Lam (reverse $3) $5 }

IfExpr :: { LineInfo -> ParsedExpr }
  : if Expr Expr Expr { If $2 $3 $4 }

TryExpr :: { LineInfo -> ParsedExpr }
  : try Expr Expr { Try $2 $3 }

SuspendExpr :: { LineInfo -> ParsedExpr }
  : suspend Expr { Suspend $2 }

ErrExpr :: { LineInfo -> ParsedExpr }
  : err STR { Error (getStr $2) }

LamArgs :: { [(Text, Maybe Type)] }
  : LamArgs IDENT ':' Type { (getIdent $2, Just $4):$1 }
  | LamArgs IDENT { (getIdent $2, Nothing):$1 }
  -- | IDENT ':' Type { [(getIdent $1, Just $3)] }
  -- | IDENT { [(getIdent $1, Nothing)] }
  | {- empty -} { [] }

LetExpr :: { LineInfo -> ParsedExpr }
  : let '(' Binders ')' Block { LetIn (NE.fromList (reverse $3)) $5 }

Binders :: { [Binder LineInfo] }
  : Binders '(' IDENT MTypeAnn Expr ')' { (Binder (getIdent $3) $4 $5):$1 }
  | '(' IDENT MTypeAnn Expr ')' { [Binder (getIdent $2) $3 $4] }

GenAppExpr :: { LineInfo -> ParsedExpr }
  : Expr AppBindList { App $1 (toAppExprList (reverse $2)) }

ProgNExpr :: { LineInfo -> ParsedExpr }
  : progn BlockBody { Block (NE.fromList (reverse $2)) }

AppList :: { [ParsedExpr] }
  : AppList Expr { $2:$1 }
  | {- empty -} { [] }

AppBindList :: { [Either ParsedExpr [(Field, Text)]] }
  : AppBindList Expr { (Left $2):$1 }
  | AppBindList BindingForm { (Right $2):$1}
  | {- empty -} { [] }

BindingForm :: { [(Field, Text)] }
  : '{' BindPairs '}' { $2 }

Binding :: { ParsedExpr }
  : '{' BindPairs '}' BlockBody { Binding $2 $4 (_ptInfo $1)}

BindPair :: { (Field, Text) }
  : STR ':=' IDENT { (Field (getStr $1), getIdent $3) }
  | TICK ':=' IDENT { (Field (getTick $1), getIdent $3) }

BindPairs :: { [(Field, Text)] }
  : BindPairs ',' BindPair { $3 : $1 }
  | BindPair { [$1] }
  -- | {- empty -} { [] }


Atom :: { ParsedExpr }
  : Var { $1 }
  | Number { $1 }
  | String { $1 }
  | List { $1 }
  | Bool { $1 }
  | Operator { $1 }
  | Object { $1 }
  | '(' ')' { Constant LUnit (_ptInfo $1) }

Operator :: { ParsedExpr }
  : and { Operator AndOp (_ptInfo $1) }
  | or { Operator OrOp (_ptInfo $1) }
  | '==' { Operator EQOp (_ptInfo $1) }
  | '!=' { Operator NEQOp (_ptInfo $1) }
  | '>'  { Operator GTOp (_ptInfo $1) }
  | '>=' { Operator GEQOp (_ptInfo $1) }
  | '<'  { Operator LTOp (_ptInfo $1) }
  | '<=' { Operator LEQOp (_ptInfo $1) }
  | '+'  { Operator AddOp (_ptInfo $1) }
  | '-'  { Operator SubOp (_ptInfo $1) }
  | '*'  { Operator MultOp (_ptInfo $1) }
  | '/'  { Operator DivOp (_ptInfo $1) }
  | '&'  { Operator BitAndOp (_ptInfo $1) }
  | '|'  { Operator BitOrOp (_ptInfo $1) }
  | '~'  { Operator BitComplementOp (_ptInfo $1) }
  | pow  { Operator PowOp (_ptInfo $1) }

Bool :: { ParsedExpr }
  : true { Constant (LBool True) (_ptInfo $1) }
  | false { Constant (LBool False) (_ptInfo $1) }

BOOLEAN :: { Bool }
  : true { True }
  | false { False }

Var :: { ParsedExpr }
  : IDENT '.' ModQual  { Var (mkQualName (getIdent $1) $3) (_ptInfo $1) }
  | IDENT { Var (mkBarename (getIdent $1)) (_ptInfo $1) }

ParsedName :: { ParsedName }
  : IDENT '.' ModQual { mkQualName (getIdent $1) $3 }
  | IDENT { mkBarename (getIdent $1) }

QualifiedName :: { QualifiedName }
  : IDENT '.' ModQual { mkQualName' (getIdent $1) $3 }

ModQual :: { (Text, Maybe Text) }
  : IDENT '.' IDENT { (getIdent $1, Just (getIdent $3)) }
  | IDENT { (getIdent $1, Nothing) }

Number :: { ParsedExpr }
  : NUM '.' NUM {% mkDecimal (getNumber $1) (getNumber $3) (_ptInfo $1) }
  | NUM { mkIntegerConstant (getNumber $1) (_ptInfo $1) }

String :: { ParsedExpr }
 : STR  { Constant (LString (getStr $1)) (_ptInfo $1) }
 | TICK { Constant (LString (getTick $1)) (_ptInfo $1) }

Object :: { ParsedExpr }
  : '{' ObjectBody '}' { Object $2 (combineSpan (_ptInfo $1) (_ptInfo $3)) }

ObjectBody :: { [(Field, ParsedExpr)] }
  : FieldPairs { $1 }

FieldPair :: { (Field, ParsedExpr) }
  : STR ':' Expr { (Field (getStr $1), $3) }
  | TICK ':' Expr { (Field (getTick $1), $3) }

FieldPairs :: { [(Field, ParsedExpr)] }
  : FieldPairs ',' FieldPair { $3 : $1 }
  | FieldPair { [$1] }
  | {- empty -} { [] }

{

combineSpans lexpr rexpr =
  let li = view termInfo lexpr
      ri = view termInfo rexpr
  in combineSpan li ri

getIdent (PosToken (TokenIdent x) _) = x
getNumber (PosToken (TokenNumber x) _) = x
getStr (PosToken (TokenString x) _ ) = x
getTick (PosToken (TokenSingleTick x) _) = x
getIdentField = Field . getIdent

mkIntegerConstant n i =
  let (n', f) = if T.head n == '-' then (T.drop 1 n, negate) else (n, id)
      strToNum = T.foldl' (\x d -> 10*x + toInteger (digitToInt d))
  in Constant (LInteger (f (strToNum 0 n'))) i

mkDecimal num dec i = do
  let (num', f) = if T.head num == '-' then (T.drop 1 num, negate) else (num, id)
      strToNum = T.foldl' (\x d -> 10*x + toInteger (digitToInt d))
      prec = T.length dec
  when (prec > 255) $ throwParseError (PrecisionOverflowError prec) i
  let out = Decimal (fromIntegral prec) (f (strToNum (strToNum 0 num') dec))
  pure $ Constant (LDecimal out) i

mkQualName ns (mod, (Just ident)) =
  let ns' = NamespaceName ns
      qn = QualifiedName ident (ModuleName mod (Just ns'))
  in QN qn
mkQualName mod (ident, Nothing) =
  let qn = QualifiedName ident (ModuleName mod Nothing)
  in QN qn

mkQualName' ns (mod, (Just ident)) =
  let ns' = NamespaceName ns
  in QualifiedName ident (ModuleName mod (Just ns'))
mkQualName' mod (ident, Nothing) = QualifiedName ident (ModuleName mod Nothing)


mkModName (ident, Nothing) = ModuleName ident Nothing
mkModName (ns, Just ident) = ModuleName ident (Just (NamespaceName ns))

mkBlock = \case
  [x] -> x
  li -> let
    nel = NE.fromList li
    i = combineSpans (NE.head nel) (NE.last nel)
    in Block nel i

-- ln0 = BN (BareName "")

mkBarename tx = BN (BareName tx)


}
