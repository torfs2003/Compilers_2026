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
  %"a" = alloca [5 x i8]
  ;  Source: chara[5];
  %".3" = bitcast [28 x i8]* @"str" to i8*
  ;  Source: printf("Enter a 5-character string:");
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".3")
  %".6" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: a
  ;  Source: &a
  ;  Source: scanf("%5s",&a);
  %".10" = call i32 (i8*, ...) @"scanf"(i8* %".6", [5 x i8]* %"a")
  %".11" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: a
  ;  Source: printf("%s",a);
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".11", [5 x i8]* %"a")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [28 x i8] c"Enter a 5-character string:\00"
@"str.1" = internal constant [4 x i8] c"%5s\00"
@"str.2" = internal constant [3 x i8] c"%s\00"