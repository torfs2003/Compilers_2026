; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: a
  %"a_load" = load i32, i32* %"a"
  ;  Source: a=0
  store i32 0, i32* %"a"
  br label %"while.cond"
while.cond:
  %"a_load.1" = load i32, i32* %"a"
  %".6" = icmp slt i32 %"a_load.1", 10
  %".7" = zext i1 %".6" to i32
  %"whilecond" = icmp ne i32 %".7", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".9" = bitcast [3 x i8]* @"str" to i8*
  %"a_load.2" = load i32, i32* %"a"
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %"a_load.2")
  %"a_load.3" = load i32, i32* %"a"
  %".11" = load i32, i32* %"a"
  %".12" = add i32 %".11", 1
  store i32 %".12", i32* %"a"
  br label %"while.cond"
while.end:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"