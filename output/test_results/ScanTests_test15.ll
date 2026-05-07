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
  %"k" = alloca i32
  ;  Source: intk;
  %"result" = alloca i32
  %".3" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: printf("%d",1)
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 1)
  ;  Source: intresult=printf("%d",1);
  store i32 %".5", i32* %"result"
  %".8" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: result
  %"result.1" = load i32, i32* %"result"
  ;  Source: printf("%d",result);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"result.1")
  %".12" = bitcast [3 x i8]* @"str.2" to i8*
  %".13" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: k
  %"k.1" = load i32, i32* %"k"
  ;  Source: &k
  ;  Source: scanf("%d",&k)
  %".17" = call i32 (i8*, ...) @"scanf"(i8* %".13", i32* %"k")
  ;  Source: printf("%d",scanf("%d",&k));
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %".17")
  %".20" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: k
  %"k.2" = load i32, i32* %"k"
  ;  Source: printf("%d",k);
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %"k.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"