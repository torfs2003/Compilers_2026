; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define float @"d"()
{
entry:
  ;  Source: return98+6*7/2.9;
  ret float 0x405c1ee580000000
}

define i32 @"main"()
{
entry:
  %"a" = alloca float
  store float 0x3fe0000000000000, float* %"a"
  ;  Source: a
  %"a_load" = load float, float* %"a"
  ;  Source: d()
  %".5" = call float @"d"()
  ;  Source: a=d();
  store float %".5", float* %"a"
  %".8" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a_load.1" = load float, float* %"a"
  ;  Source: printf("%f",a);
  %".11" = fpext float %"a_load.1" to double
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".8", double %".11")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%f\00"