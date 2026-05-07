; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32*
  ;  Source: int*x;
  ;  Source: x
  %"x.1" = load i32*, i32** %"x"
  %"deref_load" = load i32, i32* %"x.1"
  ;  Source: 'a'+*x;
  %".5" = sext i8 97 to i32
  %".6" = add i32 %".5", %"deref_load"
  ;  Source: return1;
  ret i32 1
}
