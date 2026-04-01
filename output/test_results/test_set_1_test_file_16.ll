; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx=98362;
  store i32 98362, i32* %"x"
  %"x_ptr" = alloca i32*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: int*x_ptr=&x;
  store i32* %"x", i32** %"x_ptr"
  %"p" = alloca i32**
  ;  Source: x_ptr
  %"x_ptr.1" = load i32*, i32** %"x_ptr"
  ;  Source: &x_ptr
  ;  Source: int**p=&x_ptr;
  store i32** %"x_ptr", i32*** %"p"
  %"z" = alloca i32*
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: int*z=&x;
  store i32* %"x", i32** %"z"
  %"a" = alloca float
  ;  Source: floata=856.25668;
  store float 0x408ac20da0000000, float* %"a"
  %"a_ptr" = alloca float*
  ;  Source: a
  %"a.1" = load float, float* %"a"
  ;  Source: &a
  ;  Source: float*a_ptr=&a;
  store float* %"a", float** %"a_ptr"
  ret i32 0
}
