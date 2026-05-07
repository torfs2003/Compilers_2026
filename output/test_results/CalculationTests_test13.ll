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
  %".3" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %"x.1")
  %"z" = alloca i32
  %"x.2" = load i32, i32* %"x"
  %".7" = add i32 %"x.2", 3
  store i32 %".7", i32* %"z"
  %".9" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  ;  Source: printf("%d",z);
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %"z.1")
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: z
  %"z.2" = load i32, i32* %"z"
  ;  Source: z
  %"z.3" = load i32, i32* %"z"
  %".16" = mul i32 %"z.2", %"z.3"
  ;  Source: z
  %"z.4" = load i32, i32* %"z"
  %".18" = mul i32 %".16", %"z.4"
  ;  Source: x
  %"x.4" = load i32, i32* %"x"
  ;  Source: x
  %"x.5" = load i32, i32* %"x"
  ;  Source: (x+x)
  %".22" = add i32 %"x.4", %"x.5"
  ;  Source: z*z*z*(x+x)
  %".24" = mul i32 %".18", %".22"
  ;  Source: x=z*z*z*(x+x);
  store i32 %".24", i32* %"x"
  %".27" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: x
  %"x.6" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 %"x.6")
  %"f" = alloca float
  store float 0x3fef8fde20000000, float* %"f"
  %"f2" = alloca float
  %"f.1" = load float, float* %"f"
  %".32" = fmul float %"f.1", 0x4040800000000000
  %".33" = fadd float %".32", 0x4000000000000000
  store float %".33", float* %"f2"
  %".35" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: f2
  %"f2.1" = load float, float* %"f2"
  ;  Source: (int)f2
  %".38" = fptosi float %"f2.1" to i32
  ;  Source: printf("%d",(int)f2);
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".35", i32 %".38")
  ;  Source: f2
  %"f2.2" = load float, float* %"f2"
  ;  Source: f2
  %"f2.3" = load float, float* %"f2"
  ;  Source: f
  %"f.2" = load float, float* %"f"
  ;  Source: f2+f
  %".45" = fadd float %"f2.3", %"f.2"
  ;  Source: f2=f2+f;
  store float %".45", float* %"f2"
  %".48" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: f2
  %"f2.4" = load float, float* %"f2"
  ;  Source: (int)f2
  %".51" = fptosi float %"f2.4" to i32
  ;  Source: printf("%d",(int)f2);
  %".53" = call i32 (i8*, ...) @"printf"(i8* %".48", i32 %".51")
  %"c" = alloca i8
  store i8 97, i8* %"c"
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: c='b';
  store i8 98, i8* %"c"
  %".58" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: c
  %"c.2" = load i8, i8* %"c"
  ;  Source: printf("%c",c);
  %".61" = call i32 (i8*, ...) @"printf"(i8* %".58", i8 %"c.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"
@"str.5" = internal constant [3 x i8] c"%c\00"