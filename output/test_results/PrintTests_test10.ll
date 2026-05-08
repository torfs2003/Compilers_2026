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
  %".4" = bitcast [10 x i8]* @"str" to i8*
  ;  Source: p
  %"p_load" = load float, float* %"p"
  ;  Source: printf("%f %x %d ",3.14,p,7);
  %".7" = fpext float 0x40091eb860000000 to double
  %".8" = fpext float %"p_load" to double
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".4", double %".7", double %".8", i32 7)
  %".10" = bitcast [11 x i8]* @"str.1" to i8*
  ;  Source: printf("True %d \n ");
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".10")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [10 x i8] c"%f %x %d \00"
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

@"str.1" = internal constant [11 x i8] c"True %d \0a \00"