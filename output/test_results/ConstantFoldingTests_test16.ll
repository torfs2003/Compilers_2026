; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"v" = alloca float
  ;  Source: 5.6<<7
  %".3" = sitofp i32 7 to float
  %".4" = shl float 0x4016666660000000, %".3"
  ;  Source: floatv=5.6<<7;
  store float %".4", float* %"v"
  ;  Source: return0;
  ret i32 0
}
