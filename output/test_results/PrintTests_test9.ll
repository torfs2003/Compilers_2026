; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
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
  %"p" = alloca float
  ;  Source: floatp=3.14;
  store float 0x40091eb860000000, float* %"p"
  %"q" = alloca float*
  ;  Source: p
  %"p.1" = load float, float* %"p"
  ;  Source: &p
  ;  Source: float*q=&p;
  store float* %"p", float** %"q"
  %".8" = bitcast [10 x i8]* @"str" to i8*
  ;  Source: p
  %"p.2" = load float, float* %"p"
  ;  Source: (int)p
  %".11" = fptosi float %"p.2" to i32
  ;  Source: printf("%d %d %d ",(int)3.14,(int)p,7);
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 3, i32 %".11", i32 7)
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [10 x i8] c"%d %d %d \00"