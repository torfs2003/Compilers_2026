; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"mul"(i32 %".1")
{
entry:
  %"x" = alloca i32
  store i32 %".1", i32* %"x"
  ;  Source: returnx*5;
  %"x.1" = load i32, i32* %"x"
  %".5" = mul i32 %"x.1", 5
  ret i32 %".5"
}

define i32 @"main"()
{
entry:
  %"k" = alloca i32*
  %"result" = alloca i32
  %".2" = call i32 @"mul"(i32 3)
  store i32 %".2", i32* %"result"
  ;  Source: result
  %"result.1" = load i32, i32* %"result"
  %".5" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: result
  %"result.2" = load i32, i32* %"result"
  ;  Source: printf("%d ",result)
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %"result.2")
  ;  Source: result=printf("%d ",result);
  store i32 %".8", i32* %"result"
  %".11" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: result
  %"result.3" = load i32, i32* %"result"
  ;  Source: printf("%d ",result);
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %"result.3")
  %".15" = bitcast [4 x i8]* @"str.2" to i8*
  %".16" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: result
  %"result.4" = load i32, i32* %"result"
  ;  Source: &result
  ;  Source: scanf("%d ",&result)
  %".20" = call i32 (i8*, ...) @"scanf"(i8* %".16", i32* %"result")
  ;  Source: mul(scanf("%d ",&result))
  %".22" = call i32 @"mul"(i32 %".20")
  ;  Source: printf("%d ",mul(scanf("%d ",&result)));
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %".22")
  %".25" = bitcast [4 x i8]* @"str.4" to i8*
  ;  Source: result
  %"result.5" = load i32, i32* %"result"
  ;  Source: mul(result)
  %".28" = call i32 @"mul"(i32 %"result.5")
  ;  Source: printf("%d ",mul(result));
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 %".28")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d \00"
@"str.1" = internal constant [4 x i8] c"%d \00"
@"str.2" = internal constant [4 x i8] c"%d \00"
@"str.3" = internal constant [4 x i8] c"%d \00"
@"str.4" = internal constant [4 x i8] c"%d \00"