; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca float
  ;  Source: (5/0.0)
  %".3" = sitofp i32 5 to float
  %".4" = fdiv float %".3",              0x0
  ;  Source: floata=(5/0.0);
  store float %".4", float* %"a"
  ;  Source: return0;
  ret i32 0
}
