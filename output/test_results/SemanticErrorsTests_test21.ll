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
  ;  User Comment: //*x_ptr = x; //Invalid: const assignment
  ;  Source: x_ptr
  %"x_ptr.1" = load i32*, i32** %"x_ptr"
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: &x
  ;  User Comment: //*x_ptr = x; //Invalid: const assignment
  ;  Source: x_ptr=&x;
  store i32* %"x", i32** %"x_ptr"
  ;  Source: return0;
  ret i32 0
}
