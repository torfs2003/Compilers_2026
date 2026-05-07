; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"i" = alloca i32
  store i32 0, i32* %"i"
  %"j" = alloca i32
  ;  Source: j
  %"j.1" = load i32, i32* %"j"
  ;  Source: j=0
  store i32 0, i32* %"j"
  br label %"while.cond"
while.cond:
  %"j.2" = load i32, i32* %"j"
  %".7" = icmp slt i32 %"j.2", 10
  %".8" = zext i1 %".7" to i32
  %"whilecond" = icmp ne i32 %".8", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".10" = bitcast [3 x i8]* @"str" to i8*
  %"j.3" = load i32, i32* %"j"
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %"j.3")
  %"j.4" = load i32, i32* %"j"
  %".12" = load i32, i32* %"j"
  %".13" = add i32 %".12", 1
  store i32 %".13", i32* %"j"
  br label %"while.cond"
while.end:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"