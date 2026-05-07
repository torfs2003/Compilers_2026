; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"p" = alloca i32
  %".2" = fptosi float 0x40091eb860000000 to i32
  store i32 %".2", i32* %"p"
  %"q" = alloca float*
  %".4" = bitcast i32* %"p" to float*
  store float* %".4", float** %"q"
  %".6" = bitcast [25 x i8]* @"str" to i8*
  ;  Source: p
  %"p.1" = load i32, i32* %"p"
  ;  Source: p
  %"p.2" = load i32, i32* %"p"
  ;  Source: q
  %"q.1" = load float*, float** %"q"
  %"deref_load" = load float, float* %"q.1"
  ;  Source: (int)*q
  %".11" = fptosi float %"deref_load" to i32
  ;  Source: printf("%% %d %x %d  kappa kappa",p,p,(int)*q);
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %"p.1", i32 %"p.2", i32 %".11")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [25 x i8] c"%% %d %x %d  kappa kappa\00"