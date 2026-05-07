; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

<<<<<<< HEAD
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

=======
>>>>>>> origin/optionals
define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx=5;
  store i32 5, i32* %"x"
  %"z" = alloca i32
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: x+3
  %".6" = add i32 %"x.1", 3
  ;  Source: intz=x+3;
  store i32 %".6", i32* %"z"
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  ;  Source: z
  %"z.2" = load i32, i32* %"z"
  %".12" = mul i32 %"z.1", %"z.2"
  ;  Source: z
  %"z.3" = load i32, i32* %"z"
  %".14" = mul i32 %".12", %"z.3"
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: x
  %"x.4" = load i32, i32* %"x"
  ;  Source: (x+x)
  %".18" = add i32 %"x.3", %"x.4"
  ;  Source: z*z*z*(x+x)
  %".20" = mul i32 %".14", %".18"
  ;  Source: x=z*z*z*(x+x);
  store i32 %".20", i32* %"x"
  %"f" = alloca float
  ;  Source: floatf=0.986312;
  store float 0x3fef8fde20000000, float* %"f"
  %"f2" = alloca float
  ;  Source: f
  %"f.1" = load float, float* %"f"
  %".26" = fmul float %"f.1", 0x4040800000000000
  ;  Source: f*33.0+2.0
  %".28" = fadd float %".26", 0x4000000000000000
  ;  Source: floatf2=f*33.0+2.0;
  store float %".28", float* %"f2"
  ;  Source: f2
  %"f2.1" = load float, float* %"f2"
  ;  Source: f2
  %"f2.2" = load float, float* %"f2"
  ;  Source: f
  %"f.2" = load float, float* %"f"
  ;  Source: f2+f
  %".35" = fadd float %"f2.2", %"f.2"
  ;  Source: f2=f2+f;
  store float %".35", float* %"f2"
  %"c" = alloca i8
  ;  Source: charc='a';
  store i8 97, i8* %"c"
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: c='b';
  store i8 98, i8* %"c"
  ret i32 0
}
