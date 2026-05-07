; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

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
  %".18" = fpext float %"p.3" to double
  %".19" = fpext float %"p.4" to double
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".14", i8 97, double %".18", i32 12, double %".19")
  %".21" = bitcast [5 x i8]* @"str.2" to i8*
  ;  Source: printf("%x,f",5);
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 5)
  %".24" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: p
  %"p.5" = load float, float* %"p"
  ;  Source: printf("%f ",p);
  %".27" = fpext float %"p.5" to double
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".24", double %".27")
  %".29" = bitcast [4 x i8]* @"str.4" to i8*
  ;  Source: p
  %"p.6" = load float, float* %"p"
  ;  Source: printf("%f ",p);
  %".32" = fpext float %"p.6" to double
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".29", double %".32")
  %".34" = bitcast [6 x i8]* @"str.5" to i8*
  ;  Source: p
  %"p.7" = load float, float* %"p"
  ;  Source: printf("a%fa ",p);
  %".37" = fpext float %"p.7" to double
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".34", double %".37")
  %".39" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: p
  %"p.8" = load float, float* %"p"
  ;  Source: printf("%f",p);
  %".42" = fpext float %"p.8" to double
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".39", double %".42")
  %".44" = bitcast [3 x i8]* @"str.7" to i8*
  %".45" = bitcast [28 x i8]* @"str.8" to i8*
  ;  Source: printf("%s","This is a beautifull string");
  %".47" = call i32 (i8*, ...) @"printf"(i8* %".44", i8* %".45")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [10 x i8] c"%f %f %d \00"
@"str.1" = internal constant [28 x i8] c"%% %c %f %x %f  kappa kappa\00"
@"str.2" = internal constant [5 x i8] c"%x,f\00"
@"str.3" = internal constant [4 x i8] c"%f \00"
@"str.4" = internal constant [4 x i8] c"%f \00"
@"str.5" = internal constant [6 x i8] c"a%fa \00"
@"str.6" = internal constant [3 x i8] c"%f\00"
@"str.7" = internal constant [3 x i8] c"%s\00"
@"str.8" = internal constant [28 x i8] c"This is a beautifull string\00"