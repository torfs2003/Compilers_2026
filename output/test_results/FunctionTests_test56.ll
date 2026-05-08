; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"multiply"(i32 %".1", i32 %".2")
{
entry:
  %"a" = alloca i32
  store i32 %".1", i32* %"a"
  %"b" = alloca i32
  store i32 %".2", i32* %"b"
  ;  Source: returna*b;
  %"a_load" = load i32, i32* %"a"
  %"b_load" = load i32, i32* %"b"
  %".7" = mul i32 %"a_load", %"b_load"
  ret i32 %".7"
}

define i32 @"main"()
{
entry:
  %"result" = alloca i32
  %".2" = call i32 @"multiply"(i32 3, i32 4)
  store i32 %".2", i32* %"result"
  ;  Source: return0;
  ret i32 0
}
