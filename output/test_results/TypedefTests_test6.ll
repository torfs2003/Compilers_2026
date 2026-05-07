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
  %"x.1" = load i32, i32* %"x"
  %"y.1" = load i32, i32* %"y"
  %".4" = icmp ne i32 %"x.1", 0
  %".5" = icmp ne i32 %"y.1", 0
  %".6" = and i1 %".4", %".5"
  %".7" = zext i1 %".6" to i32
  store i32 %".7", i32* %"z"
  %"b" = alloca i32
  %"y.2" = load i32, i32* %"y"
  %"z.1" = load i32, i32* %"z"
  %".9" = mul i32 %"y.2", %"z.1"
  %".10" = mul i32 %".9", 57809
  store i32 %".10", i32* %"b"
  ;  Source: return0;
  ret i32 0
}
