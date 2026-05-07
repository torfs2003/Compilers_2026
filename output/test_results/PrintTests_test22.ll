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
  %".2" = bitcast [5 x i8]* @"str" to i8*
  ;  Source: printf("%d; ",2*(2+3));
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 10)
  %".5" = bitcast [5 x i8]* @"str.1" to i8*
  ;  Source: printf("%d; ",2*4+2);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 10)
  %".8" = bitcast [5 x i8]* @"str.2" to i8*
  ;  Source: printf("%d; ",10/2+10/2);
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 10)
  %".11" = bitcast [5 x i8]* @"str.3" to i8*
  ;  Source: printf("%d; ",((100-80)/2)+(5-5));
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 10)
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [5 x i8] c"%d; \00"
@"str.1" = internal constant [5 x i8] c"%d; \00"
@"str.2" = internal constant [5 x i8] c"%d; \00"
@"str.3" = internal constant [5 x i8] c"%d; \00"