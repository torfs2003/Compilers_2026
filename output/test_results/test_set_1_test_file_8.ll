; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx=5;
  store i32 5, i32* %"x"
  %"f" = alloca float
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: floatf=x;
  %".6" = sitofp i32 %"x.1" to float
  store float %".6", float* %"f"
  %"z" = alloca i32
  ;  Source: intz=-32682;
  store i32 -32682, i32* %"z"
  ;  Source: f
  %"f.1" = load float, float* %"f"
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  %".12" = sitofp i32 %"z.1" to float
  %".13" = fmul float 0x4040800000000000, %".12"
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: 33.0*z+x
  %".16" = sitofp i32 %"x.2" to float
  %".17" = fadd float %".13", %".16"
  ;  Source: f=33.0*z+x;
  store float %".17", float* %"f"
  ;  Source: z
  %"z.2" = load i32, i32* %"z"
  ;  Source: f
  %"f.2" = load float, float* %"f"
  ;  Source: f*0.7
  %".23" = fmul float %"f.2", 0x3fe6666660000000
  ;  Source: z=f*0.7;
  %".25" = fptosi float %".23" to i32
  store i32 %".25", i32* %"z"
  %"k" = alloca i32
  ;  Source: 'a'+'z'
  %".28" = add i8 97, 122
  ;  Source: intk='a'+'z';
  %".30" = sext i8 %".28" to i32
  store i32 %".30", i32* %"k"
  ret i32 0
}
