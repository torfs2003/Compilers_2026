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
  %"k" = alloca float
  %".2" = sitofp i32 0 to float
  store float %".2", float* %"k"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: k
  %"k_load" = load float, float* %"k"
  ;  Source: printf("%f",k);
  %".7" = fpext float %"k_load" to double
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".4", double %".7")
  %".9" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: k
  %"k_load.1" = load float, float* %"k"
  ;  Source: &k
  ;  Source: scanf("%f",&k);
  %".13" = call i32 (i8*, ...) @"scanf"(i8* %".9", float* %"k")
  %".14" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: k
  %"k_load.2" = load float, float* %"k"
  ;  Source: printf("%f",k);
  %".17" = fpext float %"k_load.2" to double
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".14", double %".17")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%f\00"
@"str.1" = internal constant [3 x i8] c"%f\00"
@"str.2" = internal constant [3 x i8] c"%f\00"