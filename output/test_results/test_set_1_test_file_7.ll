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
  store float 0x40e098b2c0000000, float* %"f"
  %"z" = alloca i32
  %"f.1" = load float, float* %"f"
  %".4" = fptosi float %"f.1" to i32
  store i32 %".4", i32* %"z"
  %"z2" = alloca float
  %"x.1" = load i32, i32* %"x"
  %".6" = sitofp i32 %"x.1" to float
  store float %".6", float* %"z2"
  %"a" = alloca i32
  %"f.2" = load float, float* %"f"
  %"z2.1" = load float, float* %"z2"
  %".8" = sitofp i32 2 to float
  %".9" = fmul float %"z2.1", %".8"
  %".10" = fadd float %"f.2", %".9"
  %".11" = fptosi float %".10" to i32
  store i32 %".11", i32* %"a"
  %"f2" = alloca float
  %"f.3" = load float, float* %"f"
  store float %"f.3", float* %"f2"
  ;  Source: f2
  %"f2.1" = load float, float* %"f2"
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: z2
  %"z2.2" = load float, float* %"z2"
  %".17" = sitofp i32 195696 to float
  %".18" = fdiv float %"z2.2", %".17"
  ;  Source: (a+z2/(3*65232))
  %".20" = sitofp i32 %"a.1" to float
  %".21" = fadd float %".20", %".18"
  ;  Source: (float)(a+z2/(3*65232))
  ;  Source: f2=(float)(a+z2/(3*65232));
  store float %".21", float* %"f2"
  ret i32 0
}
