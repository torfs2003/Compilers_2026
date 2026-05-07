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
  %"x.3" = load i32, i32* %"x.2"
  store i32 %"x.3", i32* %"y"
  %"x.4" = alloca i32
  store i32 4, i32* %"x.4"
  %"z" = alloca i32
  %"x.5" = load i32, i32* %"x.4"
  store i32 %"x.5", i32* %"z"
  %"x.6" = alloca i32
  store i32 5, i32* %"x.6"
  ;  Source: return0;
  ret i32 0
}
