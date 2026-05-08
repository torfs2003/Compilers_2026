; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 5, i32* %"x"
  %"y" = alloca float
  %"x_load" = load i32, i32* %"x"
  %".3" = sitofp i32 %"x_load" to float
  store float %".3", float* %"y"
  %"z" = alloca float
  store float 0x3ff8000000000000, float* %"z"
  ;  Source: return0;
  ret i32 0
}
