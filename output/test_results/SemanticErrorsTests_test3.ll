; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx=478;
  store i32 478, i32* %"x"
  %"b" = alloca i32
  ;  Source: intb=-251454;
  store i32 -251454, i32* %"b"
  %"x_ptr" = alloca i32**
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: int**x_ptr=&x;
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
  ;  Source: return0;
  ret i32 0
}
