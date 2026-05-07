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
  ;  Source: q
  %"q.1" = load float*, float** %"q"
  ;  Source: printf("%% %d %x %f  kappa kappa",p,p,q);
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %"p.1", i32 %"p.2", float* %"q.1")
  %"z" = alloca float*
  %"q.2" = load float*, float** %"q"
  store float* %"q.2", float** %"z"
  %".12" = bitcast [25 x i8]* @"str.1" to i8*
  ;  Source: z
  %"z.1" = load float*, float** %"z"
  ;  Source: z
  %"z.2" = load float*, float** %"z"
  ;  Source: q
  %"q.3" = load float*, float** %"q"
  ;  Source: printf("%% %f %f %f  kappa kappa",z,z,q);
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".12", float* %"z.1", float* %"z.2", float* %"q.3")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [25 x i8] c"%% %d %x %f  kappa kappa\00"
@"str.1" = internal constant [25 x i8] c"%% %f %f %f  kappa kappa\00"