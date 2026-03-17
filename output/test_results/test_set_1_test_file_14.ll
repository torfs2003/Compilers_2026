; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  ;  Source: constintx=98362;
  %"x" = alloca i32
  store i32 98362, i32* %"x"
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: constint*x_ptr=&x;
  %"x_ptr" = alloca i32*
  store i32* %"x", i32** %"x_ptr"
  ;  Source: x_ptr
  %"x_ptr.1" = load i32*, i32** %"x_ptr"
  ;  Source: &x_ptr
  ;  Source: constint**p=&x_ptr;
  %"p" = alloca i32**
  store i32** %"x_ptr", i32*** %"p"
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: constint*z=&x;
  %"z" = alloca i32*
  store i32* %"x", i32** %"z"
  ;  Source: constfloata=856.25668;
  %"a" = alloca float
  store float 0x408ac20da0000000, float* %"a"
  ;  Source: a
  %"a.1" = load float, float* %"a"
  ;  Source: &a
  ;  Source: constfloat*a_ptr=&a;
  %"a_ptr" = alloca float*
  store float* %"a", float** %"a_ptr"
  ret i32 0
}
