; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32*
  ;  Source: x
  %"x_load" = load i32*, i32** %"x"
  %"deref_load" = load i32, i32* %"x_load"
  ;  Source: 'a'+*x;
  %".4" = sext i8 97 to i32
  %".5" = add i32 %".4", %"deref_load"
  ;  Source: return1;
  ret i32 1
}
