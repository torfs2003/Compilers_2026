; ModuleID = "cmm_module"
<<<<<<< HEAD
target triple = "x86_64-w64-windows-gnu"
=======
target triple = "x86_64-unknown-linux-gnu"
>>>>>>> origin/main
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
  ;  Source: constintx=98362;
  store i32 98362, i32* %"x"
  %"x_ptr" = alloca i32*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: constint*x_ptr=&x;
  store i32* %"x", i32** %"x_ptr"
  %"p" = alloca i32**
  ;  Source: x_ptr
  %"x_ptr.1" = load i32*, i32** %"x_ptr"
  ;  Source: &x_ptr
  ;  Source: constint**p=&x_ptr;
  store i32** %"x_ptr", i32*** %"p"
  %"z" = alloca i32*
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: constint*z=&x;
  store i32* %"x", i32** %"z"
  %"a" = alloca float
  ;  Source: constfloata=856.25668;
  store float 0x408ac20da0000000, float* %"a"
  %"a_ptr" = alloca float*
  ;  Source: a
  %"a.1" = load float, float* %"a"
  ;  Source: &a
  ;  Source: constfloat*a_ptr=&a;
  store float* %"a", float** %"a_ptr"
  ret i32 0
}
