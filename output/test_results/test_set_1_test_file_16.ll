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
  %"x" = alloca i32
  store i32 98362, i32* %"x"
  %"x_ptr" = alloca i32*
  store i32* %"x", i32** %"x_ptr"
  %"p" = alloca i32**
  store i32** %"x_ptr", i32*** %"p"
  %"z" = alloca i32*
  store i32* %"x", i32** %"z"
  %"a" = alloca float
  store float 0x408ac20da0000000, float* %"a"
  %"a_ptr" = alloca float*
  store float* %"a", float** %"a_ptr"
  ret i32 0
}
