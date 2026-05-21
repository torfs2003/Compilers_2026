; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca float
  %".2" = sitofp i32 5 to float
  %".3" = fdiv float %".2",              0x0
  store float %".3", float* %"a"
  ;  Source: return0;
  ret i32 0
}
