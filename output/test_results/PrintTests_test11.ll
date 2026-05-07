; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"p" = alloca float
  store float 0x40091eb860000000, float* %"p"
  %"q" = alloca float*
  store float* %"p", float** %"q"
  %".4" = bitcast [10 x i8]* @"str" to i8*
  ;  Source: p
  %"p.1" = load float, float* %"p"
  ;  Source: (int)p
  %".7" = fptosi float %"p.1" to i32
  ;  Source: printf("%d %d %d ",(int)3.14,(int)p,7);
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 3, i32 %".7", i32 7)
  %".10" = bitcast [28 x i8]* @"str.1" to i8*
  ;  Source: p
  %"p.2" = load float, float* %"p"
  ;  Source: (int)p
  %".13" = fptosi float %"p.2" to i32
  ;  Source: p
  %"p.3" = load float, float* %"p"
  ;  Source: (int)p
  %".16" = fptosi float %"p.3" to i32
  ;  Source: printf("%% %c %d %x %d  kappa kappa",'a',(int)p,12,(int)p);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".10", i8 97, i32 %".13", i32 12, i32 %".16")
  %".19" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: p
  %"p.4" = load float, float* %"p"
  ;  Source: (int)p
  %".22" = fptosi float %"p.4" to i32
  ;  Source: printf("%d",(int)p);
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %".22")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [10 x i8] c"%d %d %d \00"
@"str.1" = internal constant [28 x i8] c"%% %c %d %x %d  kappa kappa\00"
@"str.2" = internal constant [3 x i8] c"%d\00"