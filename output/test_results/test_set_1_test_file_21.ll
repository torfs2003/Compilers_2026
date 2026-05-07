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
  %"z" = alloca i32
  %"x.1" = load i32, i32* %"x"
  %".3" = add i32 %"x.1", 3
  store i32 %".3", i32* %"z"
  %"f" = alloca float
  store float 0x3fef8fde20000000, float* %"f"
  %"f2" = alloca float
  %"f.1" = load float, float* %"f"
  %".6" = fmul float %"f.1", 0x4040800000000000
  %".7" = fadd float %".6", 0x4000000000000000
  store float %".7", float* %"f2"
  %"c" = alloca i8
  store i8 97, i8* %"c"
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  ;  Source: z
  %"z.2" = load i32, i32* %"z"
  %".13" = mul i32 %"z.1", %"z.2"
  ;  Source: z
  %"z.3" = load i32, i32* %"z"
  %".15" = mul i32 %".13", %"z.3"
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: x
  %"x.4" = load i32, i32* %"x"
  ;  Source: (x+x)
  %".19" = add i32 %"x.3", %"x.4"
  ;  Source: z*z*z*(x+x)
  %".21" = mul i32 %".15", %".19"
  ;  Source: x=z*z*z*(x+x);
  store i32 %".21", i32* %"x"
  ;  Source: f2
  %"f2.1" = load float, float* %"f2"
  ;  Source: f2
  %"f2.2" = load float, float* %"f2"
  ;  Source: f
  %"f.2" = load float, float* %"f"
  ;  Source: f2+f
  %".28" = fadd float %"f2.2", %"f.2"
  ;  Source: f2=f2+f;
  store float %".28", float* %"f2"
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: c='b';
  store i8 98, i8* %"c"
  ret i32 0
}
