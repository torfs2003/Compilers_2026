; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 1, i32* %"x"
  %"y" = alloca i32
  store i32 0, i32* %"y"
  %"z" = alloca i32
  %"x_load" = load i32, i32* %"x"
  %"y_load" = load i32, i32* %"y"
  %".4" = and i32 %"x_load", %"y_load"
  store i32 %".4", i32* %"z"
  ;  Source: z
  %"z_load" = load i32, i32* %"z"
  ;  Source: z
  %"z_load.1" = load i32, i32* %"z"
  ;  Source: y
  %"y_load.1" = load i32, i32* %"y"
  ;  Source: z^y
  %".10" = xor i32 %"z_load.1", %"y_load.1"
  ;  Source: z=z^y;
  store i32 %".10", i32* %"z"
  ret i32 0
}
