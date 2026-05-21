; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 1, i32* %"x"
  %"x.1" = alloca i32
  store i32 2, i32* %"x.1"
  %"x.2" = alloca i32
  store i32 3, i32* %"x.2"
  %"y" = alloca i32
  %"x_load" = load i32, i32* %"x.2"
  store i32 %"x_load", i32* %"y"
  %"x.3" = alloca i32
  store i32 4, i32* %"x.3"
  %"z" = alloca i32
  %"x_load.1" = load i32, i32* %"x.3"
  store i32 %"x_load.1", i32* %"z"
  %"x.4" = alloca i32
  store i32 5, i32* %"x.4"
  ;  Source: return0;
  ret i32 0
}
