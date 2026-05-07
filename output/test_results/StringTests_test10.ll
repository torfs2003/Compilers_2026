; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

@"e" = internal global [6 x i8] zeroinitializer
define i32 @"main"()
{
entry:
  %".2" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: e
  ;  Source: printf("%s",e);
  %".5" = getelementptr inbounds [6 x i8], [6 x i8]* @"e", i32 0, i32 0
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".2", i8* %".5")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%s\00"