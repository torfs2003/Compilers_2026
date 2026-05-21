; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca float
  %".2" = fdiv float 0x4014000000000000,              0x0
  store float %".2", float* %"a"
  ;  Source: return0;
  ret i32 0
}
