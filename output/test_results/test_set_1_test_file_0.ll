; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  ;  Source: 2048>>-3;
  %".3" = ashr i32 2048, -3
  ret i32 0
}
