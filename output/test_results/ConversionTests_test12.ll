; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 4, i32* %"x"
  %"y" = alloca float*
  %".3" = inttoptr i32 5 to float*
  store float* %".3", float** %"y"
  %"v" = alloca float
  %"x.1" = load i32, i32* %"x"
  %"y.1" = load float*, float** %"y"
  %".5" = icmp ne i32 %"x.1", 0
  %".6" = icmp ne float* %"y.1", 0
  %".7" = and i1 %".5", %".6"
  %".8" = zext i1 %".7" to i32
  %".9" = sitofp i32 %".8" to float
  store float %".9", float* %"v"
  ;  Source: return0;
  ret i32 0
}
