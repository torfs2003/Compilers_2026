; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"b" = alloca i32
  store i32 5, i32* %"b"
  %"c" = alloca i32
  store i32 7, i32* %"c"
  %"d" = alloca i32
  store i32 0, i32* %"d"
  %"a" = alloca i32
  %"b.1" = load i32, i32* %"b"
  %"c.1" = load i32, i32* %"c"
  %".5" = icmp ne i32 %"b.1", 0
  %".6" = icmp ne i32 %"c.1", 0
  %".7" = and i1 %".5", %".6"
  %".8" = zext i1 %".7" to i32
  %"d.1" = load i32, i32* %"d"
  %".9" = icmp ne i32 %".8", 0
  %".10" = icmp ne i32 %"d.1", 0
  %".11" = or i1 %".9", %".10"
  %".12" = zext i1 %".11" to i32
  store i32 %".12", i32* %"a"
  ;  Source: return0;
  ret i32 0
}
