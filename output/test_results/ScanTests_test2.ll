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
  %"s" = alloca float*
  %"q_load" = load float*, float** %"q"
  store float* %"q_load", float** %"s"
  %".5" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: s
  %"s_load" = load float*, float** %"s"
  ;  Source: scanf("%f",s);
  %".8" = call i32 (i8*, ...) @"scanf"(i8* %".5", float* %"s_load")
  %".9" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: s
  %"s_load.1" = load float*, float** %"s"
  ;  Source: &s
  ;  Source: printf("%f",&s);
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".9", float** %"s")
  %".14" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: p
  ;  Source: printf("%f",p);
  %".17" = fpext float 0x40091eb860000000 to double
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".14", double %".17")
  %".19" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: q
  %"q_load.1" = load float*, float** %"q"
  ;  Source: scanf("%f",q);
  %".22" = call i32 (i8*, ...) @"scanf"(i8* %".19", float* %"q_load.1")
  %".23" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: q
  %"q_load.2" = load float*, float** %"q"
  ;  Source: &q
  ;  Source: printf("%f",&q);
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".23", float** %"q")
  %".28" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: p
  ;  Source: printf("%f",p);
  %".31" = fpext float 0x40091eb860000000 to double
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".28", double %".31")
  %".33" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: p
  ;  Source: &p
  ;  Source: scanf("%f",&p);
  %".37" = call i32 (i8*, ...) @"scanf"(i8* %".33", float* %"p")
  %".38" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: p
  ;  Source: printf("%f",p);
  %".41" = fpext float 0x40091eb860000000 to double
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".38", double %".41")
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