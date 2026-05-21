; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.MyStruct" = type {i32, float}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"aStruct" = alloca %"struct.MyStruct"
  ;  Source: structMyStructaStruct;
  ;  Source: aStruct
  ;  Source: (char*)aStruct;
  %".5" = bitcast %"struct.MyStruct"* %"aStruct" to i8*
  ;  Source: return0;
  ret i32 0
}
