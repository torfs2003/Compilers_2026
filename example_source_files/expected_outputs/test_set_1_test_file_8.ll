; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  ;  Source: intx=5;
  %"x" = alloca i32
  store i32 5, i32* %"x"
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: floatf=x;
  %"f" = alloca float
  %".6" = sitofp i32 %"x.1" to float
  store float %".6", float* %"f"
  ;  Source: intz=-32682;
  %"z" = alloca i32
  store i32 -32682, i32* %"z"
  ;  Source: intk;
  %"k" = alloca i32
  ;  Source: f
  %"f.1" = load float, float* %"f"
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  %".13" = sitofp i32 %"z.1" to float
  %".14" = fmul float 0x4040800000000000, %".13"
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: 33.0*z+x
  %".17" = sitofp i32 %"x.2" to float
  %".18" = fadd float %".14", %".17"
  ;  Source: f=33.0*z+x;
  store float %".18", float* %"f"
  ;  Source: z
  %"z.2" = load i32, i32* %"z"
  ;  Source: f
  %"f.2" = load float, float* %"f"
  ;  Source: f*0.7
  %".24" = fmul float %"f.2", 0x3fe6666660000000
  ;  Source: z=f*0.7;
  %".26" = fptosi float %".24" to i32
  store i32 %".26", i32* %"z"
  ;  Source: k
  %"k.1" = load i32, i32* %"k"
  ;  Source: 'a'+'z'
  %".30" = add i8 97, 122
  ;  Source: k='a'+'z';
  %".32" = sext i8 %".30" to i32
  store i32 %".32", i32* %"k"
  ret i32 0
}
