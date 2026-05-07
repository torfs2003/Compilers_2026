; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

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
  %"x" = alloca i32
  ;  Source: constintx=4;
  store i32 4, i32* %"x"
  %"y" = alloca i32
  ;  Source: inty;
  %"z" = alloca i32
  ;  Source: intz;
  ;  Source: y
  %"y.1" = load i32, i32* %"y"
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: y=x;
  store i32 %"x.1", i32* %"y"
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: z=x;
  store i32 %"x.2", i32* %"z"
  %"a" = alloca i32
  ;  Source: y
  %"y.2" = load i32, i32* %"y"
  ;  Source: z
  %"z.2" = load i32, i32* %"z"
  ;  Source: y+z
  %".17" = add i32 %"y.2", %"z.2"
  ;  Source: inta=y+z;
  store i32 %".17", i32* %"a"
  ;  Source: return0;
  ret i32 0
}
