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
  store float 0x3fe18ef340000000, float* %"f"
  %"y" = alloca i32
  %"x.1" = load i32, i32* %"x"
  %".4" = mul i32 %"x.1", 35
  %".5" = mul i32 %".4", -5
  store i32 %".5", i32* %"y"
  %".7" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: y
  %"y.1" = load i32, i32* %"y"
  ;  Source: printf("%x",y);
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %"y.1")
  %"z" = alloca float
  %"f.1" = load float, float* %"f"
  %"f.2" = load float, float* %"f"
  %".11" = fmul float %"f.1", %"f.2"
  %"f.3" = load float, float* %"f"
  %".12" = fmul float %".11", %"f.3"
  store float %".12", float* %"z"
  %".14" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: z
  %"z.1" = load float, float* %"z"
  ;  Source: printf("%f",z);
  %".17" = fpext float %"z.1" to double
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".14", double %".17")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%x\00"
@"str.1" = internal constant [3 x i8] c"%f\00"