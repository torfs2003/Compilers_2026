; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"some_func"(i32 %".1", i32 %".2")
{
entry:
  %"x" = alloca i32
  store i32 %".1", i32* %"x"
  %"y" = alloca i32
  store i32 %".2", i32* %"y"
  ;  Source: returnx*y;
  %"x_load" = load i32, i32* %"x"
  %"y_load" = load i32, i32* %"y"
  %".7" = mul i32 %"x_load", %"y_load"
  ret i32 %".7"
}

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  %".2" = call i32 @"some_func"(i32 5, i32 1)
  store i32 %".2", i32* %"x"
  ret i32 0
}
