; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
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
  %"x" = alloca float
  ;  Source: floatx=1.13;
  store float 0x3ff2147ae0000000, float* %"x"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: printf("%d",2048);
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 2048)
  %".7" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: x
  %"x.1" = load float, float* %"x"
  ;  Source: printf("%f",x);
  %".10" = fpext float %"x.1" to double
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".7", double %".10")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%f\00"