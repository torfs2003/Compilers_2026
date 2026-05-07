; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"k" = alloca i8
  ;  Source: chark='0';
  store i8 48, i8* %"k"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: k
  %"k.1" = load i8, i8* %"k"
  ;  Source: printf("%c",k);
  %".7" = zext i8 %"k.1" to i32
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %".7")
  %".9" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: k
  %"k.2" = load i8, i8* %"k"
  ;  Source: &k
  ;  Source: scanf("%c",&k);
  %".13" = call i32 (i8*, ...) @"scanf"(i8* %".9", i8* %"k")
  %".14" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: k
  %"k.3" = load i8, i8* %"k"
  ;  Source: printf("%c",k);
  %".17" = zext i8 %"k.3" to i32
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %".17")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%c\00"
@"str.2" = internal constant [3 x i8] c"%c\00"