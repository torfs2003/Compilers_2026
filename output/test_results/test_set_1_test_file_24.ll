; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 4, i32* %"x"
  %"b" = alloca i32
  store i32 9632, i32* %"b"
  %"x_ptr" = alloca i32*
  store i32* %"b", i32** %"x_ptr"
  ;  Source: x_ptr
  %"x_ptr.1" = load i32*, i32** %"x_ptr"
  %"deref_load" = load i32, i32* %"x_ptr.1"
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: *x_ptr=x;
  store i32 %"x.1", i32* %"x_ptr.1"
  ret i32 0
}
