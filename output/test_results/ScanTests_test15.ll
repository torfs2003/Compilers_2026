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
  %"k" = alloca i32
  %"result" = alloca i32
  %".2" = bitcast [3 x i8]* @"str" to i8*
  %".3" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 1)
  store i32 %".3", i32* %"result"
  %".5" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: result
  %"result_load" = load i32, i32* %"result"
  ;  Source: printf("%d",result);
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %"result_load")
  %".9" = bitcast [3 x i8]* @"str.2" to i8*
  %".10" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: k
  %"k_load" = load i32, i32* %"k"
  ;  Source: &k
  ;  Source: scanf("%d",&k)
  %".14" = call i32 (i8*, ...) @"scanf"(i8* %".10", i32* %"k")
  ;  Source: printf("%d",scanf("%d",&k));
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %".14")
  %".17" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: k
  %"k_load.1" = load i32, i32* %"k"
  ;  Source: printf("%d",k);
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".17", i32 %"k_load.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"