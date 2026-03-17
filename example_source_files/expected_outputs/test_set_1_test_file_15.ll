; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  ;  Source: intx=4;
  %"x" = alloca i32
  store i32 4, i32* %"x"
  ;  Source: intb=9632;
  %"b" = alloca i32
  store i32 9632, i32* %"b"
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: constint*x_ptr=&x;
  %"x_ptr" = alloca i32*
  store i32* %"x", i32** %"x_ptr"
  ;  Source: x_ptr
  %"x_ptr.1" = load i32*, i32** %"x_ptr"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: &b
  ;  Source: x_ptr=&b;
  store i32* %"b", i32** %"x_ptr"
  ret i32 0
}
