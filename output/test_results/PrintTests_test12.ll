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
  %".4" = bitcast [7 x i8]* @"str" to i8*
  ;  Source: p
  %"p.1" = load float, float* %"p"
  ;  Source: (int)p
  %".7" = fptosi float %"p.1" to i32
  ;  Source: printf("%d %d ",(int)3.14,(int)p);
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 3, i32 %".7")
  %".10" = bitcast [7 x i8]* @"str.1" to i8*
  ;  Source: printf("True  ");
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".10")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [7 x i8] c"%d %d \00"
@"str.1" = internal constant [7 x i8] c"True  \00"