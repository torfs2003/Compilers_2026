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
  %"p" = alloca i32
  %".2" = fptosi float 0x40091eb860000000 to i32
  store i32 %".2", i32* %"p"
  %"q" = alloca float*
  %".4" = bitcast i32* %"p" to float*
  store float* %".4", float** %"q"
  %".6" = bitcast [25 x i8]* @"str" to i8*
  ;  Source: p
  %"p_load" = load i32, i32* %"p"
  ;  Source: p
  %"p_load.1" = load i32, i32* %"p"
  ;  Source: q
  %"q_load" = load float*, float** %"q"
  ;  Source: printf("%% %d %x %f  kappa kappa",p,p,q);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %"p_load", i32 %"p_load.1", float* %"q_load")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [25 x i8] c"%% %d %x %f  kappa kappa\00"