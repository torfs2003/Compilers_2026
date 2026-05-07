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
  %".2" = bitcast [8 x i8]* @"str" to i8*
  %".3" = bitcast [6 x i8]* @"str.1" to i8*
  %".4" = bitcast [6 x i8]* @"str.2" to i8*
  ;  Source: printf("%s %s!\n","Hello","World");
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".2", i8* %".3", i8* %".4")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [8 x i8] c"%s %s!\0a\00"
@"str.1" = internal constant [6 x i8] c"Hello\00"
@"str.2" = internal constant [6 x i8] c"World\00"