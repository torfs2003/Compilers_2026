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
  ;  Source: printf("%f %f %d ",3.14,p,7);
  %".11" = fpext float 0x40091eb860000000 to double
  %".12" = fpext float %"p.2" to double
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".8", double %".11", double %".12", i32 7)
  %".14" = bitcast [28 x i8]* @"str.1" to i8*
  ;  Source: p
  %"p.3" = load float, float* %"p"
  ;  Source: p
  %"p.4" = load float, float* %"p"
  ;  Source: printf("%% %c %f %x %f  kappa kappa",'a',p,12,p);
  %".18" = zext i8 97 to i32
  %".19" = fpext float %"p.3" to double
  %".20" = fpext float %"p.4" to double
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %".18", double %".19", i32 12, double %".20")
  %".22" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: p
  %"p.5" = load float, float* %"p"
  ;  Source: printf("%f",p);
  %".25" = fpext float %"p.5" to double
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".22", double %".25")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [10 x i8] c"%f %f %d \00"
@"str.1" = internal constant [28 x i8] c"%% %c %f %x %f  kappa kappa\00"
@"str.2" = internal constant [3 x i8] c"%f\00"