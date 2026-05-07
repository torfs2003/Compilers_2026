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
  %".2" = bitcast [5 x i8]* @"str" to i8*
  ;  Source: printf("%d; ",1<2);
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 1)
  %".5" = bitcast [5 x i8]* @"str.1" to i8*
  ;  Source: printf("%d; ",1>2);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 0)
  %".8" = bitcast [5 x i8]* @"str.2" to i8*
  ;  Source: printf("%d; ",1<=2);
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 1)
  %".11" = bitcast [5 x i8]* @"str.3" to i8*
  ;  Source: printf("%d; ",1>=2);
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 0)
  %".14" = bitcast [5 x i8]* @"str.4" to i8*
  ;  Source: printf("%d; ",(0.5>0.0)!=(0.0>1.0));
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 1)
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [5 x i8] c"%d; \00"
@"str.1" = internal constant [5 x i8] c"%d; \00"
@"str.2" = internal constant [5 x i8] c"%d; \00"
@"str.3" = internal constant [5 x i8] c"%d; \00"
@"str.4" = internal constant [5 x i8] c"%d; \00"