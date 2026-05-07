; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: constintx=5;
  store i32 5, i32* %"x"
  %"f" = alloca float
  ;  Source: constfloatf=0.5487;
  store float 0x3fe18ef340000000, float* %"f"
  %"y" = alloca i32
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  %".7" = mul i32 %"x.1", 35
  ;  Source: x*35*-5
  %".9" = mul i32 %".7", -5
  ;  Source: constinty=x*35*-5;
  store i32 %".9", i32* %"y"
  %".12" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: y
  %"y.1" = load i32, i32* %"y"
  ;  Source: printf("%x",y);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"y.1")
  %"z" = alloca float
  ;  Source: f
  %"f.1" = load float, float* %"f"
  ;  Source: f
  %"f.2" = load float, float* %"f"
  %".18" = fmul float %"f.1", %"f.2"
  ;  Source: f
  %"f.3" = load float, float* %"f"
  ;  Source: f*f*f
  %".21" = fmul float %".18", %"f.3"
  ;  Source: constfloatz=f*f*f;
  store float %".21", float* %"z"
  %".24" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: z
  %"z.1" = load float, float* %"z"
  ;  Source: printf("%f",z);
  %".27" = fpext float %"z.1" to double
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".24", double %".27")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%x\00"
@"str.1" = internal constant [3 x i8] c"%f\00"