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
  %"x" = alloca float
  ;  Source: floatx=0.478984;
  store float 0x3fdea7ac80000000, float* %"x"
  %"y" = alloca float
  ;  Source: floaty=5489451.245847;
  store float 0x4154f0cac0000000, float* %"y"
  %"f" = alloca float
  ;  Source: floatf=1654.0000;
  store float 0x4099d80000000000, float* %"f"
  %"z" = alloca float
  ;  Source: floatz=0000.00000;
  store float              0x0, float* %"z"
  %".10" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: z
  %"z.1" = load float, float* %"z"
  ;  Source: printf("%f",z);
  %".13" = fpext float %"z.1" to double
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".10", double %".13")
  ;  Source: z
  %"z.2" = load float, float* %"z"
  ;  Source: z=-565.21547;
  store float 0xc081a9b940000000, float* %"z"
  %".18" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: x
  %"x.1" = load float, float* %"x"
  ;  Source: printf("%f",x);
  %".21" = fpext float %"x.1" to double
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".18", double %".21")
  %".23" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: y
  %"y.1" = load float, float* %"y"
  ;  Source: printf("%f",y);
  %".26" = fpext float %"y.1" to double
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".23", double %".26")
  %".28" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: f
  %"f.1" = load float, float* %"f"
  ;  Source: printf("%f",f);
  %".31" = fpext float %"f.1" to double
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".28", double %".31")
  %".33" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: z
  %"z.3" = load float, float* %"z"
  ;  Source: printf("%f",z);
  %".36" = fpext float %"z.3" to double
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".33", double %".36")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%f\00"
@"str.1" = internal constant [3 x i8] c"%f\00"
@"str.2" = internal constant [3 x i8] c"%f\00"
@"str.3" = internal constant [3 x i8] c"%f\00"
@"str.4" = internal constant [3 x i8] c"%f\00"