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
  store float 0x3ff2147ae0000000, float* %"x"
  %".3" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: printf("%d",2048);
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 2048)
  %".6" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: x
  %"x_load" = load float, float* %"x"
  ;  Source: printf("%f",x);
  %".9" = fpext float %"x_load" to double
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".6", double %".9")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%f\00"