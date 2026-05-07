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
  %".2" = bitcast [3 x i8]* @"str" to i8*
  %".3" = bitcast [28 x i8]* @"str.1" to i8*
  ;  Source: printf("%s","This is a beautifull string");
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".2", i8* %".3")
  %"hello" = alloca [5 x i8]
  %".6" = getelementptr [5 x i8], [5 x i8]* %"hello", i32 0, i32 0
  store i8 72, i8* %".6"
  %".8" = getelementptr [5 x i8], [5 x i8]* %"hello", i32 0, i32 1
  store i8 101, i8* %".8"
  %".10" = getelementptr [5 x i8], [5 x i8]* %"hello", i32 0, i32 2
  store i8 108, i8* %".10"
  %".12" = getelementptr [5 x i8], [5 x i8]* %"hello", i32 0, i32 3
  store i8 108, i8* %".12"
  %".14" = getelementptr [5 x i8], [5 x i8]* %"hello", i32 0, i32 4
  store i8 111, i8* %".14"
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%s\00"
@"str.1" = internal constant [28 x i8] c"This is a beautifull string\00"