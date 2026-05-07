; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"p" = alloca float
  ;  Source: constfloatp=3.14;
  store float 0x40091eb860000000, float* %"p"
  %"q" = alloca float*
  ;  Source: p
  %"p.1" = load float, float* %"p"
  ;  Source: &p
  ;  Source: float*q=&p;
  store float* %"p", float** %"q"
  %"s" = alloca float*
  ;  Source: q
  %"q.1" = load float*, float** %"q"
  ;  Source: constfloat*s=q;
  store float* %"q.1", float** %"s"
  %".11" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: s
  %"s.1" = load float*, float** %"s"
  ;  Source: scanf("%f",s);
  %".14" = call i32 (i8*, ...) @"scanf"(i8* %".11", float** %"s")
  %".15" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: s
  %"s.2" = load float*, float** %"s"
  ;  Source: &s
  ;  Source: printf("%f",&s);
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".15", float** %"s")
  %".20" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: p
  %"p.2" = load float, float* %"p"
  ;  Source: printf("%f",p);
  %".23" = fpext float %"p.2" to double
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".20", double %".23")
  %".25" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: q
  %"q.2" = load float*, float** %"q"
  ;  Source: scanf("%f",q);
  %".28" = call i32 (i8*, ...) @"scanf"(i8* %".25", float** %"q")
  %".29" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: q
  %"q.3" = load float*, float** %"q"
  ;  Source: &q
  ;  Source: printf("%f",&q);
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".29", float** %"q")
  %".34" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: p
  %"p.3" = load float, float* %"p"
  ;  Source: printf("%f",p);
  %".37" = fpext float %"p.3" to double
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".34", double %".37")
  %".39" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: p
  %"p.4" = load float, float* %"p"
  ;  Source: &p
  ;  Source: scanf("%f",&p);
  %".43" = call i32 (i8*, ...) @"scanf"(i8* %".39", float* %"p")
  %".44" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: p
  %"p.5" = load float, float* %"p"
  ;  Source: printf("%f",p);
  %".47" = fpext float %"p.5" to double
  %".48" = call i32 (i8*, ...) @"printf"(i8* %".44", double %".47")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%f\00"
@"str.1" = internal constant [3 x i8] c"%f\00"
@"str.2" = internal constant [3 x i8] c"%f\00"
@"str.3" = internal constant [3 x i8] c"%f\00"
@"str.4" = internal constant [3 x i8] c"%f\00"
@"str.5" = internal constant [3 x i8] c"%f\00"
@"str.6" = internal constant [3 x i8] c"%f\00"
@"str.7" = internal constant [3 x i8] c"%f\00"