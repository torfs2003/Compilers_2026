; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 5, i32* %"x"
  %"f" = alloca float
  %"x.1" = load i32, i32* %"x"
  %".3" = sitofp i32 %"x.1" to float
  store float %".3", float* %"f"
  %"z" = alloca i32
  store i32 -32682, i32* %"z"
  %"k" = alloca i32
  ;  Source: f
  %"f.1" = load float, float* %"f"
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  %".8" = sitofp i32 %"z.1" to float
  %".9" = fmul float 0x4040800000000000, %".8"
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: 33.0*z+x
  %".12" = sitofp i32 %"x.2" to float
  %".13" = fadd float %".9", %".12"
  ;  Source: f=33.0*z+x;
  store float %".13", float* %"f"
  ;  Source: z
  %"z.2" = load i32, i32* %"z"
  ;  Source: f
  %"f.2" = load float, float* %"f"
  ;  Source: f*0.7
  %".19" = fmul float %"f.2", 0x3fe6666660000000
  ;  Source: z=f*0.7;
  %".21" = fptosi float %".19" to i32
  store i32 %".21", i32* %"z"
  ;  Source: k
  %"k.1" = load i32, i32* %"k"
  ;  Source: 'a'+'z'
  %".25" = add i8 97, 122
  ;  Source: k='a'+'z';
  %".27" = sext i8 %".25" to i32
  store i32 %".27", i32* %"k"
  ret i32 0
}
