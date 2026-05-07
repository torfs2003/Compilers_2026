; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"p" = alloca i32
  store i32 8, i32* %"p"
  %"q" = alloca float*
  %".3" = bitcast i32* %"p" to float*
  store float* %".3", float** %"q"
  %".5" = bitcast [25 x i8]* @"str" to i8*
  ;  Source: p
  %"p.1" = load i32, i32* %"p"
  ;  Source: p
  %"p.2" = load i32, i32* %"p"
  ;  Source: (int)p
  ;  Source: q
  %"q.1" = load float*, float** %"q"
  %"deref_load" = load float, float* %"q.1"
  ;  Source: (int)*q
  %".11" = fptosi float %"deref_load" to i32
  ;  Source: printf("%% %d %x %d  kappa kappa",p,(int)p,(int)*q);
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %"p.1", i32 %"p.2", i32 %".11")
  %"z" = alloca float*
  %"q.2" = load float*, float** %"q"
  store float* %"q.2", float** %"z"
  %".15" = bitcast [25 x i8]* @"str.1" to i8*
  ;  Source: z
  %"z.1" = load float*, float** %"z"
  %"deref_load.1" = load float, float* %"z.1"
  ;  Source: (int)*z
  %".18" = fptosi float %"deref_load.1" to i32
  ;  Source: z
  %"z.2" = load float*, float** %"z"
  %"deref_load.2" = load float, float* %"z.2"
  ;  Source: (int)*z
  %".21" = fptosi float %"deref_load.2" to i32
  ;  Source: q
  %"q.3" = load float*, float** %"q"
  %"deref_load.3" = load float, float* %"q.3"
  ;  Source: (int)*q
  %".24" = fptosi float %"deref_load.3" to i32
  ;  Source: printf("%% %d %d %d  kappa kappa",(int)*z,(int)*z,(int)*q);
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %".18", i32 %".21", i32 %".24")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [25 x i8] c"%% %d %x %d  kappa kappa\00"
@"str.1" = internal constant [25 x i8] c"%% %d %d %d  kappa kappa\00"