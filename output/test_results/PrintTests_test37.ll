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

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %".2" = bitcast [13 x i8]* @"str" to i8*
  ;  Source: printf("test: %d %f\n",1);
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 1)
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [13 x i8] c"test: %d %f\0a\00"