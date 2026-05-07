; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.MyStruct" = type {i32, float}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"myStruct" = alloca %"struct.MyStruct"
  %"intValue" = alloca i32
  %".2" = bitcast %"struct.MyStruct"* %"myStruct" to i32*
  %"deref_load" = load i32, i32* %".2"
  store i32 %"deref_load", i32* %"intValue"
  ;  Source: return0;
  ret i32 0
}
