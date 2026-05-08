; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 5, i32* %"x"
  %"f" = alloca float
  store float 0x40e098b2c0000000, float* %"f"
  %"z" = alloca i32
  %"f_load" = load float, float* %"f"
  %".4" = fptosi float %"f_load" to i32
  store i32 %".4", i32* %"z"
  %"z2" = alloca float
  %"x_load" = load i32, i32* %"x"
  %".6" = sitofp i32 %"x_load" to float
  store float %".6", float* %"z2"
  %"a" = alloca i32
  %"f_load.1" = load float, float* %"f"
  %"z2_load" = load float, float* %"z2"
  %".8" = sitofp i32 2 to float
  %".9" = fmul float %"z2_load", %".8"
  %".10" = fadd float %"f_load.1", %".9"
  %".11" = fptosi float %".10" to i32
  store i32 %".11", i32* %"a"
  %"f2" = alloca float
  %"f_load.2" = load float, float* %"f"
  store float %"f_load.2", float* %"f2"
  ;  Source: f2
  %"f2_load" = load float, float* %"f2"
  ;  Source: a
  %"a_load" = load i32, i32* %"a"
  ;  Source: z2
  %"z2_load.1" = load float, float* %"z2"
  %".17" = sitofp i32 195696 to float
  %".18" = fdiv float %"z2_load.1", %".17"
  ;  Source: (a+z2/(3*65232))
  %".20" = sitofp i32 %"a_load" to float
  %".21" = fadd float %".20", %".18"
  ;  Source: (float)(a+z2/(3*65232))
  ;  Source: f2=(float)(a+z2/(3*65232));
  store float %".21", float* %"f2"
  ret i32 0
}
