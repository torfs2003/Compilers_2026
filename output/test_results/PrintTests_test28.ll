; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %".2" = bitcast [7 x i8]* @"str" to i8*
  ;  Source: printf("%d%d%c",10,(int)0.5,'%');
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 10, i32 0, i8 37)
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [7 x i8] c"%d%d%c\00"