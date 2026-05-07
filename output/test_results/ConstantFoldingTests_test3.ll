; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca float
  %".2" = sdiv i32 5, 0
  %".3" = sitofp i32 %".2" to float
  store float %".3", float* %"a"
  ;  Source: return0;
  ret i32 0
}
