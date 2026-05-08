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
  %"p" = alloca float
  store float 0x40091eb860000000, float* %"p"
  %"q" = alloca float*
  store float* %"p", float** %"q"
  %".4" = bitcast [10 x i8]* @"str" to i8*
  ;  Source: p
  %"p_load" = load float, float* %"p"
  ;  Source: printf("%f %f %d ",3.14,p,7);
  %".7" = fpext float 0x40091eb860000000 to double
  %".8" = fpext float %"p_load" to double
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".4", double %".7", double %".8", i32 7)
  %".10" = bitcast [25 x i8]* @"str.1" to i8*
  ;  Source: p
  %"p_load.1" = load float, float* %"p"
  ;  Source: printf("%% %c %d %f  kappa kappa",'a',12,p);
  %".13" = sext i8 97 to i32
  %".14" = fpext float %"p_load.1" to double
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %".13", i32 12, double %".14")
  %".16" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: p
  %"p_load.2" = load float, float* %"p"
  ;  Source: printf("%f ",p);
  %".19" = fpext float %"p_load.2" to double
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".16", double %".19")
  %".21" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: p
  %"p_load.3" = load float, float* %"p"
  ;  Source: printf("%f ",p);
  %".24" = fpext float %"p_load.3" to double
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".21", double %".24")
  %".26" = bitcast [6 x i8]* @"str.4" to i8*
  ;  Source: p
  %"p_load.4" = load float, float* %"p"
  ;  Source: printf("a%fa ",p);
  %".29" = fpext float %"p_load.4" to double
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".26", double %".29")
  %".31" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: p
  %"p_load.5" = load float, float* %"p"
  ;  Source: printf("%f",p);
  %".34" = fpext float %"p_load.5" to double
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".31", double %".34")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [10 x i8] c"%f %f %d \00"
@"str.1" = internal constant [25 x i8] c"%% %c %d %f  kappa kappa\00"
@"str.2" = internal constant [4 x i8] c"%f \00"
@"str.3" = internal constant [4 x i8] c"%f \00"
@"str.4" = internal constant [6 x i8] c"a%fa \00"
@"str.5" = internal constant [3 x i8] c"%f\00"