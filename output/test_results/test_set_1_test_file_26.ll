; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  ;  Source: intx=478;
  %"x" = alloca i32
  store i32 478, i32* %"x"
  ;  Source: intb=-251454;
  %"b" = alloca i32
  store i32 -251454, i32* %"b"
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: int**x_ptr=&x;
  %"x_ptr" = alloca i32**
  %".9" = bitcast i32* %"x" to i32**
  store i32** %".9", i32*** %"x_ptr"
  ;  Source: x_ptr
  %"x_ptr.1" = load i32**, i32*** %"x_ptr"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: &b
  ;  Source: x_ptr=&b;
  %".15" = bitcast i32* %"b" to i32**
  store i32** %".15", i32*** %"x_ptr"
  ret i32 0
}
