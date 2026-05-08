; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"main"()
{
entry:
  %"line_of_code" = alloca i32
  store i32 5, i32* %"line_of_code"
  %"f" = alloca float
  %".3" = sitofp i32 45 to float
  store float %".3", float* %"f"
  %"c" = alloca i8
  store i8 98, i8* %"c"
  %"x" = alloca i32
  store i32 5, i32* %"x"
  ret i32 0
}
