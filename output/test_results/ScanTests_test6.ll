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
  %"k" = alloca i8
  store i8 48, i8* %"k"
  %".3" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: k
  %"k_load" = load i8, i8* %"k"
  ;  Source: printf("%c",k);
  %".6" = sext i8 %"k_load" to i32
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %".6")
  %".8" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: k
  %"k_load.1" = load i8, i8* %"k"
  ;  Source: &k
  ;  Source: scanf("%c",&k);
  %".12" = call i32 (i8*, ...) @"scanf"(i8* %".8", i8* %"k")
  %".13" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: k
  %"k_load.2" = load i8, i8* %"k"
  ;  Source: printf("%c",k);
  %".16" = sext i8 %"k_load.2" to i32
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %".16")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%c\00"
@"str.2" = internal constant [3 x i8] c"%c\00"