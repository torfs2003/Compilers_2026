; ModuleID = "cmm_module"
<<<<<<< HEAD
target triple = "x86_64-w64-windows-gnu"
=======
target triple = "x86_64-unknown-linux-gnu"
>>>>>>> origin/main
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
  %"k" = alloca i32
  ;  Source: intk=0;
  store i32 0, i32* %"k"
  br label %"while.cond"
while.cond:
  %"whilecond" = icmp ne i32 1, 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".6" = bitcast [3 x i8]* @"str" to i8*
  %"k.1" = load i32, i32* %"k"
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %"k.1")
  %"k.2" = load i32, i32* %"k"
  %".8" = load i32, i32* %"k"
  %".9" = add i32 %".8", 1
  store i32 %".9", i32* %"k"
  %"k.3" = load i32, i32* %"k"
  %".11" = icmp sgt i32 %"k.3", 10
  %".12" = zext i1 %".11" to i32
  %"ifcond" = icmp ne i32 %".12", 0
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