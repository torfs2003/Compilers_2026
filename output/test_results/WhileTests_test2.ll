; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: inta;
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: a=0
  store i32 0, i32* %"a"
  br label %"while.cond"
while.cond:
  %"a.2" = load i32, i32* %"a"
  %".7" = icmp slt i32 %"a.2", 10
  %".8" = zext i1 %".7" to i32
  %"whilecond" = icmp ne i32 %".8", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".10" = bitcast [3 x i8]* @"str" to i8*
  %"a.3" = load i32, i32* %"a"
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %"a.3")
  %"a.4" = load i32, i32* %"a"
  %".12" = load i32, i32* %"a"
  %".13" = add i32 %".12", 1
  store i32 %".13", i32* %"a"
  br label %"while.cond"
while.end:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"