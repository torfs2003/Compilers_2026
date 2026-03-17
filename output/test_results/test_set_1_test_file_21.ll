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
  ;  Source: x+3
  %".6" = add i32 %"x.1", 3
  ;  Source: intz=x+3;
  %"z" = alloca i32
  store i32 %".6", i32* %"z"
  ;  Source: floatf=0.986312;
  %"f" = alloca float
  store float 0x3fef8fde20000000, float* %"f"
  ;  Source: f
  %"f.1" = load float, float* %"f"
  %".12" = fmul float %"f.1", 0x4040800000000000
  ;  Source: f*33.0+2.0
  %".14" = fadd float %".12", 0x4000000000000000
  ;  Source: floatf2=f*33.0+2.0;
  %"f2" = alloca float
  store float %".14", float* %"f2"
  ;  Source: charc='a';
  %"c" = alloca i8
  store i8 97, i8* %"c"
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  ;  Source: z
  %"z.2" = load i32, i32* %"z"
  %".22" = mul i32 %"z.1", %"z.2"
  ;  Source: z
  %"z.3" = load i32, i32* %"z"
  %".24" = mul i32 %".22", %"z.3"
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: x
  %"x.4" = load i32, i32* %"x"
  ;  Source: (x+x)
  %".28" = add i32 %"x.3", %"x.4"
  ;  Source: z*z*z*(x+x)
  %".30" = mul i32 %".24", %".28"
  ;  Source: x=z*z*z*(x+x);
  store i32 %".30", i32* %"x"
  ;  Source: f2
  %"f2.1" = load float, float* %"f2"
  ;  Source: f2
  %"f2.2" = load float, float* %"f2"
  ;  Source: f
  %"f.2" = load float, float* %"f"
  ;  Source: f2+f
  %".37" = fadd float %"f2.2", %"f.2"
  ;  Source: f2=f2+f;
  store float %".37", float* %"f2"
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: c='b';
  store i8 98, i8* %"c"
  ret i32 0
}
