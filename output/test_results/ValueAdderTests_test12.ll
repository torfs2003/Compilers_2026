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
  %"k" = alloca i32
  store i32 0, i32* %"k"
  br label %"while.cond"
while.cond:
  %"whilecond" = icmp ne i32 1, 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".5" = bitcast [3 x i8]* @"str" to i8*
  %"k_load" = load i32, i32* %"k"
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %"k_load")
  %"k_load.1" = load i32, i32* %"k"
  %".7" = load i32, i32* %"k"
  %".8" = add i32 %".7", 1
  store i32 %".8", i32* %"k"
  %"k_load.2" = load i32, i32* %"k"
  %".10" = icmp sgt i32 %"k_load.2", 10
  %".11" = zext i1 %".10" to i32
  %"ifcond" = icmp ne i32 %".11", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
while.end:
  ;  Source: return0;
  ret i32 0
if.then:
  br label %"while.end"
if.end:
  br label %"while.cond"
}

@"str" = internal constant [3 x i8] c"%d\00"