; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 478, i32* %"x"
  %"b" = alloca i32
  store i32 -251454, i32* %"b"
  %"b_ptr" = alloca i32*
  store i32* %"b", i32** %"b_ptr"
  %"x_ptr" = alloca i32**
  store i32** %"b_ptr", i32*** %"x_ptr"
  ;  Source: x_ptr
  %"x_ptr_load" = load i32**, i32*** %"x_ptr"
  ;  Source: b_ptr
  %"b_ptr_load" = load i32*, i32** %"b_ptr"
  ;  Source: x_ptr=b_ptr;
  %".9" = bitcast i32* %"b_ptr_load" to i32**
  store i32** %".9", i32*** %"x_ptr"
  ;  User Comment: //Warning
  ;  Source: x_ptr
  %"x_ptr_load.1" = load i32**, i32*** %"x_ptr"
  ;  Source: b
  %"b_load" = load i32, i32* %"b"
  ;  User Comment: //Warning
  ;  Source: x_ptr=b;
  %".16" = inttoptr i32 %"b_load" to i32**
  store i32** %".16", i32*** %"x_ptr"
  ;  User Comment: //Warning
  ;  Source: x_ptr
  %"x_ptr_load.2" = load i32**, i32*** %"x_ptr"
  ;  Source: b
  %"b_load.1" = load i32, i32* %"b"
  ;  Source: &b
  ;  User Comment: //Warning
  ;  Source: x_ptr=&b;
  %".24" = bitcast i32* %"b" to i32**
  store i32** %".24", i32*** %"x_ptr"
  ;  User Comment: //Warning
  ;  Source: return0;
  ret i32 0
}
