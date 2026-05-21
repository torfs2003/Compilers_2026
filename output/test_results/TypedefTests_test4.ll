; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"K" = alloca i32
  ;  Source: K
  %"K_load" = load i32, i32* %"K"
  ;  Source: K++;
  %".4" = load i32, i32* %"K"
  %".5" = add i32 %".4", 1
  store i32 %".5", i32* %"K"
  ;  Source: K
  %"K_load.1" = load i32, i32* %"K"
  ;  Source: K=39-7;
  store i32 32, i32* %"K"
  ;  Source: return0;
  ret i32 0
}
