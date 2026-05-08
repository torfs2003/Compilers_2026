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
  store i32 4, i32* %"x"
  %"y" = alloca i32
  %"z" = alloca i32
  ;  Source: y
  %"y_load" = load i32, i32* %"y"
  ;  Source: y=x;
  store i32 4, i32* %"y"
  ;  Source: z
  %"z_load" = load i32, i32* %"z"
  ;  Source: z=x;
  store i32 4, i32* %"z"
  %"a" = alloca i32
  %"y_load.1" = load i32, i32* %"y"
  %"z_load.1" = load i32, i32* %"z"
  %".9" = add i32 %"y_load.1", %"z_load.1"
  store i32 %".9", i32* %"a"
  ;  Source: return0;
  ret i32 0
}
