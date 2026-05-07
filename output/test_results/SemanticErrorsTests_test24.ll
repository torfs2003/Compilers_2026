; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx=4;
  store i32 4, i32* %"x"
  %"b" = alloca i32
  ;  Source: intb=9632;
  store i32 9632, i32* %"b"
  %"x_ptr" = alloca i32*
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: &b
  ;  Source: constint*x_ptr=&b;
  store i32* %"b", i32** %"x_ptr"
  ;  Source: x_ptr
  %"x_ptr.1" = load i32*, i32** %"x_ptr"
  %"deref_load" = load i32, i32* %"x_ptr.1"
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: *x_ptr=x;
  store i32 %"x.1", i32* %"x_ptr.1"
  ;  User Comment: //Invalid: const assignment
  ;  Source: return0;
  ret i32 0
}
