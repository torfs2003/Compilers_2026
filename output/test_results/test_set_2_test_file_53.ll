; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 5, i32* %"x"
  %"c" = alloca i8
  store i8 97, i8* %"c"
  ;  Source: x
  %"x_load" = load i32, i32* %"x"
  ;  Source: c
  %"c_load" = load i8, i8* %"c"
  ;  Source: x+c;
  %".7" = sext i8 %"c_load" to i32
  %".8" = add i32 %"x_load", %".7"
  ;  Source: return1;
  ret i32 1
}
