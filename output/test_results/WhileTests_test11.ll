; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

@"True" = internal global i32 1
define i32 @"main"()
{
entry:
  %"k" = alloca i32
  store i32 0, i32* %"k"
  ;  Source: k
  %"k.1" = load i32, i32* %"k"
  ;  Source: k=0;
  store i32 0, i32* %"k"
  br label %"while.cond"
while.cond:
  %"whilecond" = icmp ne i32 1, 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".8" = bitcast [3 x i8]* @"str" to i8*
  %"k.2" = load i32, i32* %"k"
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"k.2")
  %"k.3" = load i32, i32* %"k"
  %".10" = load i32, i32* %"k"
  %".11" = add i32 %".10", 1
  store i32 %".11", i32* %"k"
  %"k.4" = load i32, i32* %"k"
  %".13" = icmp sgt i32 %"k.4", 10
  %".14" = zext i1 %".13" to i32
  %"ifcond" = icmp ne i32 %".14", 0
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