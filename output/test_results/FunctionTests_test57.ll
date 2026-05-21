; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"add"(i32 %".1", i32 %".2")
{
entry:
  %"a" = alloca i32
  store i32 %".1", i32* %"a"
  %"b" = alloca i32
  store i32 %".2", i32* %"b"
  ;  Source: returna+b;
  %"a_load" = load i32, i32* %"a"
  %"b_load" = load i32, i32* %"b"
  %".7" = add i32 %"a_load", %"b_load"
  ret i32 %".7"
}

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 5, i32* %"x"
  %"y" = alloca i32
  store i32 10, i32* %"y"
  %"result" = alloca i32
  %"x_load" = load i32, i32* %"x"
  %"y_load" = load i32, i32* %"y"
  %".4" = call i32 @"add"(i32 %"x_load", i32 %"y_load")
  store i32 %".4", i32* %"result"
  ;  Source: return0;
  ret i32 0
}
