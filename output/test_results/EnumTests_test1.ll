; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

@"x" = internal global i32 1
define i32 @"main"()
{
entry:
  %"day" = alloca i32
  ;  Source: enumweekday;
  ;  Source: day
  %"day.1" = load i32, i32* %"day"
  ;  Source: day=Wed;
  store i32 2, i32* %"day"
  %".6" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: day
  %"day.2" = load i32, i32* %"day"
  ;  Source: printf("%d",day);
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %"day.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"