; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: constintx=5;
  store i32 5, i32* %"x"
  %"f" = alloca float
  ;  Source: constfloatf=0.5487;
  store float 0x3fe18ef340000000, float* %"f"
  %"y" = alloca i32
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  %".7" = mul i32 %"x.1", 35
  ;  Source: x*35*-5
  %".9" = mul i32 %".7", -5
  ;  Source: constinty=x*35*-5;
  store i32 %".9", i32* %"y"
  %"z" = alloca float
  ;  Source: f
  %"f.1" = load float, float* %"f"
  ;  Source: f
  %"f.2" = load float, float* %"f"
  %".14" = fmul float %"f.1", %"f.2"
  ;  Source: f
  %"f.3" = load float, float* %"f"
  ;  Source: f*f*f
  %".17" = fmul float %".14", %"f.3"
  ;  Source: constfloatz=f*f*f;
  store float %".17", float* %"z"
  ret i32 0
}
