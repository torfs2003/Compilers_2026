; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

@"x" = internal global i32 1
define i32 @"main"()
{
entry:
  %".2" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  %"x" = load i32, i32* @"x"
  ;  Source: printf("%d",x);
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 %"x")
  %"x.1" = alloca i32
  store i32 2, i32* %"x.1"
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"