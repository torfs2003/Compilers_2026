; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 5, i32* %"x"
  %"f" = alloca float
  %"x_load" = load i32, i32* %"x"
  %".3" = sitofp i32 %"x_load" to float
  store float %".3", float* %"f"
  %"z" = alloca i32
  store i32 -32682, i32* %"z"
  ;  Source: f
  %"f_load" = load float, float* %"f"
  ;  Source: z
  %"z_load" = load i32, i32* %"z"
  %".8" = sitofp i32 %"z_load" to float
  %".9" = fmul float 0x4040800000000000, %".8"
  ;  Source: x
  %"x_load.1" = load i32, i32* %"x"
  ;  Source: 33.0*z+x
  %".12" = sitofp i32 %"x_load.1" to float
  %".13" = fadd float %".9", %".12"
  ;  Source: f=33.0*z+x;
  store float %".13", float* %"f"
  ;  Source: z
  %"z_load.1" = load i32, i32* %"z"
  ;  Source: f
  %"f_load.1" = load float, float* %"f"
  ;  Source: f*0.7
  %".19" = fmul float %"f_load.1", 0x3fe6666660000000
  ;  Source: z=f*0.7;
  %".21" = fptosi float %".19" to i32
  store i32 %".21", i32* %"z"
  %"k" = alloca i32
  %".23" = add i8 97, 122
  %".24" = sext i8 %".23" to i32
  store i32 %".24", i32* %"k"
  ;  Source: return0;
  ret i32 0
}
