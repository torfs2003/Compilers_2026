; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"z" = alloca i32
  %"z_load" = load i32, i32* %"z"
  store i32 %"z_load", i32* %"z"
  ;  Source: return0;
  ret i32 0
}
