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
  %".2" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: e
  %"e_load" = load i8*, i8** @"e"
  ;  Source: printf("%s",e);
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".2", i8* %"e_load")
  ;  Source: return0;
  ret i32 0
}

@"e" = internal global i8* 0
@"str" = internal constant [6 x i8] c"hello\00"
@"str.1" = internal constant [3 x i8] c"%s\00"