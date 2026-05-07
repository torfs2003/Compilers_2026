; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"union.grammar_rule_production" = type {i32, i32}
%"struct.grammar_rule" = type {%"struct.grammar_rule"*, i32, i32}
%"struct.grammar" = type {}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"v" = alloca %"union.grammar_rule_production"
  ;  Source: return0;
  ret i32 0
}
