; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"k" = alloca i32
  ;  Source: kaask=3;
  store i32 3, i32* %"k"
  %"z" = alloca i32
  ;  Source: appelz;
  ;  Source: return0;
  ret i32 0
}
