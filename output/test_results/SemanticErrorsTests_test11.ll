; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
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
  %"b_ptr" = alloca i32*
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: &b
  ;  Source: int*b_ptr=&b;
  store i32* %"b", i32** %"b_ptr"
  %"x_ptr" = alloca i32**
  ;  Source: b_ptr
  %"b_ptr.1" = load i32*, i32** %"b_ptr"
  ;  Source: &b_ptr
  ;  Source: int**x_ptr=&b_ptr;
  store i32** %"b_ptr", i32*** %"x_ptr"
  ;  Source: x_ptr
  %"x_ptr.1" = load i32**, i32*** %"x_ptr"
  ;  Source: b_ptr
  %"b_ptr.2" = load i32*, i32** %"b_ptr"
  ;  Source: x_ptr=b_ptr;
  %".17" = bitcast i32* %"b_ptr.2" to i32**
  store i32** %".17", i32*** %"x_ptr"
  ;  User Comment: //Warning
  ;  Source: x_ptr
  %"x_ptr.2" = load i32**, i32*** %"x_ptr"
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  ;  User Comment: //Warning
  ;  Source: x_ptr=b;
  %".24" = inttoptr i32 %"b.2" to i32**
  store i32** %".24", i32*** %"x_ptr"
  ;  User Comment: //Warning
  ;  Source: x_ptr
  %"x_ptr.3" = load i32**, i32*** %"x_ptr"
  ;  Source: b
  %"b.3" = load i32, i32* %"b"
  ;  Source: &b
  ;  User Comment: //Warning
  ;  Source: x_ptr=&b;
  %".32" = bitcast i32* %"b" to i32**
  store i32** %".32", i32*** %"x_ptr"
  ;  User Comment: //Warning
  ;  Source: return0;
  ret i32 0
}
