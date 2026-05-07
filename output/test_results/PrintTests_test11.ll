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
  %".14" = bitcast [28 x i8]* @"str.1" to i8*
  ;  Source: p
  %"p.3" = load float, float* %"p"
  ;  Source: (int)p
  %".17" = fptosi float %"p.3" to i32
  ;  Source: p
  %"p.4" = load float, float* %"p"
  ;  Source: (int)p
  %".20" = fptosi float %"p.4" to i32
  ;  Source: printf("%% %c %d %x %d  kappa kappa",'a',(int)p,12,(int)p);
  %".22" = zext i8 97 to i32
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %".22", i32 %".17", i32 12, i32 %".20")
  %".24" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: p
  %"p.5" = load float, float* %"p"
  ;  Source: (int)p
  %".27" = fptosi float %"p.5" to i32
  ;  Source: printf("%d",(int)p);
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 %".27")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [10 x i8] c"%d %d %d \00"
@"str.1" = internal constant [28 x i8] c"%% %c %d %x %d  kappa kappa\00"
@"str.2" = internal constant [3 x i8] c"%d\00"