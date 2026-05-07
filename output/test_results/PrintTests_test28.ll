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
  %".2" = bitcast [7 x i8]* @"str" to i8*
  ;  Source: printf("%d%f%c",10,0.5,'%');
  %".4" = fpext float 0x3fe0000000000000 to double
  %".5" = zext i8 37 to i32
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 10, double %".4", i32 %".5")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [7 x i8] c"%d%f%c\00"