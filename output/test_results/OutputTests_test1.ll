; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 478, i32* %"x"
  %"b" = alloca i32
  store i32 -251454, i32* %"b"
  %"x_ptr" = alloca i32**
  %".4" = bitcast i32* %"x" to i32**
  store i32** %".4", i32*** %"x_ptr"
  ;  Source: x_ptr
  %"x_ptr.1" = load i32**, i32*** %"x_ptr"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: &b
  ;  Source: x_ptr=&b;
  %".10" = bitcast i32* %"b" to i32**
  store i32** %".10", i32*** %"x_ptr"
  ;  Source: return0;
  ret i32 0
}
