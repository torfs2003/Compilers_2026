; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

<<<<<<< HEAD
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

=======
>>>>>>> origin/optionals
define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: constintx=25;
  store i32 25, i32* %"x"
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: x=25;
  store i32 25, i32* %"x"
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: x=-6532;
  store i32 -6532, i32* %"x"
  ret i32 0
}
