; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"b" = alloca [2 x i32]
  ;  Source: intb[1+1]={1,2};
  %".3" = getelementptr [2 x i32], [2 x i32]* %"b", i32 0, i32 0
  store i32 1, i32* %".3"
  %".5" = getelementptr [2 x i32], [2 x i32]* %"b", i32 0, i32 1
  store i32 2, i32* %".5"
  ;  Source: return0;
  ret i32 0
}
