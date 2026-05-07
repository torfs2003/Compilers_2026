; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

%"struct.MyStruct" = type {i32, float}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"aStruct" = alloca %"struct.MyStruct"
  ;  Source: structMyStructaStruct;
  ;  Source: aStruct
  ;  Source: (char*)aStruct;
  %".5" = ptrtoint %"struct.MyStruct"* %"aStruct" to i8
  ;  Source: return0;
  ret i32 0
}
