; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

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
  %"x_ptr_load" = load i32*, i32** %"x_ptr"
  %"deref_load" = load i32, i32* %"x_ptr_load"
  ;  Source: x
  %"x_load" = load i32, i32* %"x"
  ;  Source: *x_ptr=x;
  store i32 %"x_load", i32* %"x_ptr_load"
  ;  User Comment: //Invalid: const assignment
  ;  Source: return0;
  ret i32 0
}
