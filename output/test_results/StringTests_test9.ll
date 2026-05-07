; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

@"e" = internal global [3 x i32] zeroinitializer
define i32 @"main"()
{
entry:
  %".2" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: e
  ;  Source: *e
  ;  Source: printf("%d",*e);
  %".6" = getelementptr inbounds [3 x i32], [3 x i32]* @"e", i32 0, i32 0
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".2", i32* %".6")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"