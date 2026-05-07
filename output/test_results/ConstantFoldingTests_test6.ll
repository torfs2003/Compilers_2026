; ModuleID = "cmm_module"
<<<<<<< HEAD
target triple = "x86_64-w64-windows-gnu"
=======
target triple = "x86_64-unknown-linux-gnu"
>>>>>>> origin/main
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca float
  ;  Source: (5.0/0)
  %".3" = sitofp i32 0 to float
  %".4" = fdiv float 0x4014000000000000, %".3"
  ;  Source: floata=(5.0/0);
  store float %".4", float* %"a"
  ;  Source: return0;
  ret i32 0
}
