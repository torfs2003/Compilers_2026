; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx=5;
  store i32 5, i32* %"x"
  %"y" = alloca float
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: floaty=x;
  %".6" = sitofp i32 %"x.1" to float
  store float %".6", float* %"y"
  %"z" = alloca float
  ;  Source: floatz=0.5+1;
  store float 0x3ff8000000000000, float* %"z"
  ;  Source: return0;
  ret i32 0
}
