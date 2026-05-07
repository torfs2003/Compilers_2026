; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx=4;
  store i32 4, i32* %"x"
  %"y" = alloca float*
  ;  Source: float*y=5;
  %".5" = inttoptr i32 5 to float*
  store float* %".5", float** %"y"
  %"v" = alloca float
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: y
  %"y.1" = load float*, float** %"y"
  ;  Source: x&&y
  %".10" = ptrtoint float* %"y.1" to i32
  %".11" = icmp ne i32 %"x.1", 0
  %".12" = icmp ne i32 %".10", 0
  %".13" = and i1 %".11", %".12"
  %".14" = zext i1 %".13" to i32
  ;  Source: floatv=x&&y;
  %".16" = sitofp i32 %".14" to float
  store float %".16", float* %"v"
  ;  Source: return0;
  ret i32 0
}
