; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

@"x" = internal global i32 0
@"y" = internal global i32 0
define i32 @"main"()
{
entry:
  %".2" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: y
  %"y" = load i32, i32* @"y"
  ;  Source: printf("%d",y);
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 %"y")
  %".6" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: printf("%d",1024);
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 1024)
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"