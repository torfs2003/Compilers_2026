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

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"k" = alloca float
  ;  Source: floatk=0;
  %".3" = sitofp i32 0 to float
  store float %".3", float* %"k"
  %".5" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: k
  %"k.1" = load float, float* %"k"
  ;  Source: printf("%f",k);
  %".8" = fpext float %"k.1" to double
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".5", double %".8")
  %".10" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: k
  %"k.2" = load float, float* %"k"
  ;  Source: &k
  ;  Source: scanf("%f",&k);
  %".14" = call i32 (i8*, ...) @"scanf"(i8* %".10", float* %"k")
  %".15" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: k
  %"k.3" = load float, float* %"k"
  ;  Source: printf("%f",k);
  %".18" = fpext float %"k.3" to double
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".15", double %".18")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%f\00"
@"str.1" = internal constant [3 x i8] c"%f\00"
@"str.2" = internal constant [3 x i8] c"%f\00"