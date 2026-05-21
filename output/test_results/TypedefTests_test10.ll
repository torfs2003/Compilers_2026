; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"b" = alloca i32
  store i32 4, i32* %"b"
  %"x" = alloca i32
  store i32 4, i32* %"x"
  ;  Source: return0;
  ret i32 0
}
