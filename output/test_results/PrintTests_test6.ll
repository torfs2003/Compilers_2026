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
  %".2" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: printf("%d",(int)5.2);
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 5)
  %".5" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: printf("%d",5);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 5)
  %".8" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: printf("%c",'a');
  %".10" = zext i8 97 to i32
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %".10")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%c\00"