; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca float
  store float 0x4010ccccc0000000, float* %"x"
  %"y" = alloca float*
  %".3" = inttoptr i32 5 to float*
  store float* %".3", float** %"y"
  %"v" = alloca float
  %"x.1" = load float, float* %"x"
  %"y.1" = load float*, float** %"y"
  %".5" = fcmp one float %"x.1",              0x0
  %".6" = icmp ne float* %"y.1", 0
  %".7" = and i1 %".5", %".6"
  %".8" = zext i1 %".7" to i32
  %".9" = sitofp i32 %".8" to float
  store float %".9", float* %"v"
  ;  Source: return0;
  ret i32 0
}
