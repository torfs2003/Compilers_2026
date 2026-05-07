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
  %".5" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  ;  Source: printf("%d",z);
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %"z.1")
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: z
  %"z.2" = load i32, i32* %"z"
  ;  Source: z
  %"z.3" = load i32, i32* %"z"
  %".12" = mul i32 %"z.2", %"z.3"
  ;  Source: z
  %"z.4" = load i32, i32* %"z"
  %".14" = mul i32 %".12", %"z.4"
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
  %".23" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: z
  %"z.5" = load i32, i32* %"z"
  ;  Source: printf("%d",z);
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %"z.5")
  %".27" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: x
  %"x.5" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 %"x.5")
  %"f" = alloca float
  store float 0x3fef8fde20000000, float* %"f"
  %"f2" = alloca float
  %"f.1" = load float, float* %"f"
  %".32" = fmul float %"f.1", 0x4040800000000000
  %".33" = fadd float %".32", 0x4000000000000000
  store float %".33", float* %"f2"
  %".35" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: f
  %"f.2" = load float, float* %"f"
  ;  Source: (int)f
  %".38" = fptosi float %"f.2" to i32
  ;  Source: printf("%d",(int)f);
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".35", i32 %".38")
  %".41" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: f2
  %"f2.1" = load float, float* %"f2"
  ;  Source: (int)f2
  %".44" = fptosi float %"f2.1" to i32
  ;  Source: printf("%d",(int)f2);
  %".46" = call i32 (i8*, ...) @"printf"(i8* %".41", i32 %".44")
  ;  Source: f2
  %"f2.2" = load float, float* %"f2"
  ;  Source: f2
  %"f2.3" = load float, float* %"f2"
  ;  Source: f
  %"f.3" = load float, float* %"f"
  ;  Source: f2+f
  %".51" = fadd float %"f2.3", %"f.3"
  ;  Source: f2=f2+f;
  store float %".51", float* %"f2"
  %".54" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: f2
  %"f2.4" = load float, float* %"f2"
  ;  Source: (int)f2
  %".57" = fptosi float %"f2.4" to i32
  ;  Source: printf("%d",(int)f2);
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".54", i32 %".57")
  %"c" = alloca i8
  store i8 97, i8* %"c"
  %".61" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: printf("%c",c);
  %".64" = call i32 (i8*, ...) @"printf"(i8* %".61", i8 %"c.1")
  ;  Source: c
  %"c.2" = load i8, i8* %"c"
  ;  Source: c='b';
  store i8 98, i8* %"c"
  %".68" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: c
  %"c.3" = load i8, i8* %"c"
  ;  Source: printf("%c",c);
  %".71" = call i32 (i8*, ...) @"printf"(i8* %".68", i8 %"c.3")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"
@"str.5" = internal constant [3 x i8] c"%d\00"
@"str.6" = internal constant [3 x i8] c"%c\00"
@"str.7" = internal constant [3 x i8] c"%c\00"