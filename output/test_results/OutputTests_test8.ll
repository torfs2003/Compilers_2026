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
  %"x" = alloca float
  store float 0x3fdea7ac80000000, float* %"x"
  %"y" = alloca float
  store float 0x4154f0cac0000000, float* %"y"
  %"f" = alloca float
  store float 0x4099d80000000000, float* %"f"
  %"z" = alloca float
  store float              0x0, float* %"z"
  %".6" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: z
  %"z.1" = load float, float* %"z"
  ;  Source: printf("%f",z);
  %".9" = fpext float %"z.1" to double
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".6", double %".9")
  ;  Source: z
  %"z.2" = load float, float* %"z"
  ;  Source: z=-565.21547;
  store float 0xc081a9b940000000, float* %"z"
  %".14" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: x
  %"x.1" = load float, float* %"x"
  ;  Source: printf("%f",x);
  %".17" = fpext float %"x.1" to double
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".14", double %".17")
  %".19" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: y
  %"y.1" = load float, float* %"y"
  ;  Source: printf("%f",y);
  %".22" = fpext float %"y.1" to double
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".19", double %".22")
  %".24" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: f
  %"f.1" = load float, float* %"f"
  ;  Source: printf("%f",f);
  %".27" = fpext float %"f.1" to double
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".24", double %".27")
  %".29" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: z
  %"z.3" = load float, float* %"z"
  ;  Source: printf("%f",z);
  %".32" = fpext float %"z.3" to double
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".29", double %".32")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%f\00"
@"str.1" = internal constant [3 x i8] c"%f\00"
@"str.2" = internal constant [3 x i8] c"%f\00"
@"str.3" = internal constant [3 x i8] c"%f\00"
@"str.4" = internal constant [3 x i8] c"%f\00"