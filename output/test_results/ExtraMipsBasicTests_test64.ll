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
  %".2" = bitcast [6 x i8]* @"str" to i8*
  ;  Source: printf("%3d%c",5,'a');
  %".4" = zext i8 97 to i32
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 5, i32 %".4")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [6 x i8] c"%3d%c\00"