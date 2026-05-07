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
  ;  Source: (5/0)
  %".3" = sdiv i32 5, 0
  ;  Source: floata=(5/0);
  %".5" = sitofp i32 %".3" to float
  store float %".5", float* %"a"
  ;  Source: return0;
  ret i32 0
}
