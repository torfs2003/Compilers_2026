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

define void @"printAppel"()
{
entry:
  %".2" = bitcast [3 x i8]* @"str" to i8*
  %".3" = bitcast [6 x i8]* @"str.1" to i8*
  ;  Source: printf("%s","Appel");
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".2", i8* %".3")
  ret void
}

@"str" = internal constant [3 x i8] c"%s\00"
@"str.1" = internal constant [6 x i8] c"Appel\00"
define i32 @"main"()
{
entry:
  ;  Source: printAppel();
  call void @"printAppel"()
  ;  Source: return0;
  ret i32 0
}
