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
  ;  Source: floatf=33989.586265;
  %"f" = alloca float
  store float 0x40e098b2c0000000, float* %"f"
  ;  Source: f
  %"f.1" = load float, float* %"f"
  ;  Source: (int)f
  %".8" = fptosi float %"f.1" to i32
  ;  Source: intz=(int)f;
  %"z" = alloca i32
  store i32 %".8", i32* %"z"
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: (float)x
  %".13" = sitofp i32 %"x.1" to float
  ;  Source: floatz2=(float)x;
  %"z2" = alloca float
  store float %".13", float* %"z2"
  ;  Source: f
  %"f.2" = load float, float* %"f"
  ;  Source: z2
  %"z2.1" = load float, float* %"z2"
  %".18" = sitofp i32 2 to float
  %".19" = fmul float %"z2.1", %".18"
  ;  Source: (f+z2*2)
  %".21" = fadd float %"f.2", %".19"
  ;  Source: (int)(f+z2*2)
  %".23" = fptosi float %".21" to i32
  ;  Source: inta=(int)(f+z2*2);
  %"a" = alloca i32
  store i32 %".23", i32* %"a"
  ;  Source: f
  %"f.3" = load float, float* %"f"
  ;  Source: (float)f
  ;  Source: floatf2=(float)f;
  %"f2" = alloca float
  store float %"f.3", float* %"f2"
  ;  Source: f2
  %"f2.1" = load float, float* %"f2"
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: z2
  %"z2.2" = load float, float* %"z2"
  %".33" = sitofp i32 195696 to float
  %".34" = fdiv float %"z2.2", %".33"
  ;  Source: (a+z2/(3*65232))
  %".36" = sitofp i32 %"a.1" to float
  %".37" = fadd float %".36", %".34"
  ;  Source: (float)(a+z2/(3*65232))
  ;  Source: f2=(float)(a+z2/(3*65232));
  store float %".37", float* %"f2"
  ret i32 0
}
