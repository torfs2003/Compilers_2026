; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca float
  ;  Source: (5.0/0.0)
  %".3" = fdiv float 0x4014000000000000,              0x0
  ;  Source: floata=(5.0/0.0);
  store float %".3", float* %"a"
  ;  Source: return0;
  ret i32 0
}
