; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"p" = alloca float
  store float 0x40091eb860000000, float* %"p"
  %"q" = alloca float*
  store float* %"p", float** %"q"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: q
  %"q_load" = load float*, float** %"q"
  ;  Source: &q
  ;  Source: scanf("%f",&q);
  %".8" = call i32 (i8*, ...) @"scanf"(i8* %".4", float** %"q")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%f\00"
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")
