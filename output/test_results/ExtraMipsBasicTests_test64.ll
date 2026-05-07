; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %".2" = bitcast [6 x i8]* @"str" to i8*
  ;  Source: printf("%3d%c",5,'a');
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 5, i8 97)
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [6 x i8] c"%3d%c\00"