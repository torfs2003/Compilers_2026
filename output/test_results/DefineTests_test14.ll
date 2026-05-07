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

declare i32 @"appel"()

define i32 @"peer"()
{
entry:
  ;  Source: returnprintf("%d",5);
  %".3" = bitcast [3 x i8]* @"str" to i8*
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 5)
  ret i32 %".4"
}

@"str" = internal constant [3 x i8] c"%d\00"
define i32 @"main"()
{
entry:
  %".2" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: peer()
  %".4" = call i32 @"peer"()
  ;  Source: printf("%d",peer());
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 %".4")
  ;  User Comment: /* Test Function includes */
  ;  Source: return0;
  ret i32 0
}

@"str.1" = internal constant [3 x i8] c"%d\00"