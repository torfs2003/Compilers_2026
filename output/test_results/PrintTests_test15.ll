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
  %"p" = alloca i32
  ;  Source: intp=3.14;
  %".3" = fptosi float 0x40091eb860000000 to i32
  store i32 %".3", i32* %"p"
  %"q" = alloca float*
  ;  Source: p
  %"p.1" = load i32, i32* %"p"
  ;  Source: &p
  ;  Source: float*q=&p;
  %".8" = bitcast i32* %"p" to float*
  store float* %".8", float** %"q"
  %".10" = bitcast [25 x i8]* @"str" to i8*
  ;  Source: p
  %"p.2" = load i32, i32* %"p"
  ;  Source: p
  %"p.3" = load i32, i32* %"p"
  ;  Source: q
  %"q.1" = load float*, float** %"q"
  ;  Source: printf("%% %d %x %f  kappa kappa",p,p,q);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %"p.2", i32 %"p.3", float* %"q.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [25 x i8] c"%% %d %x %f  kappa kappa\00"