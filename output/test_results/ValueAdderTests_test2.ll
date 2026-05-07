; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 1, i32* %"a"
  %"b" = alloca i32
  %"a.1" = load i32, i32* %"a"
  store i32 %"a.1", i32* %"b"
  %"c" = alloca i32
  %"a.2" = load i32, i32* %"a"
  %".4" = add i32 %"a.2", 1
  store i32 %".4", i32* %"c"
  ;  Source: return0;
  ret i32 0
}
