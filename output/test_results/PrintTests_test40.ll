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
  %"k" = alloca i32*
  %"result" = alloca i32
  %".2" = bitcast [3 x i8]* @"str" to i8*
  %".3" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 1)
  store i32 %".3", i32* %"result"
  %"lol" = alloca float
  %".5" = bitcast [3 x i8]* @"str.1" to i8*
  %"result.1" = load i32, i32* %"result"
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %"result.1")
  %".7" = sitofp i32 %".6" to float
  store float %".7", float* %"lol"
  %".9" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: lol
  %"lol.1" = load float, float* %"lol"
  ;  Source: printf("%f",lol);
  %".12" = fpext float %"lol.1" to double
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".9", double %".12")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%f\00"