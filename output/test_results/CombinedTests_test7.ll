; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"forLoopCheck"(i32 %".1", i32 %".2")
{
entry:
  %"toCheck" = alloca i32
  store i32 %".1", i32* %"toCheck"
  %"range" = alloca i32
  store i32 %".2", i32* %"range"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.1" = load i32, i32* %"i"
  %"range.1" = load i32, i32* %"range"
  %".8" = icmp sle i32 %"i.1", %"range.1"
  %".9" = zext i1 %".8" to i32
  %"whilecond" = icmp ne i32 %".9", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"i.2" = load i32, i32* %"i"
  %"toCheck.1" = load i32, i32* %"toCheck"
  %".11" = icmp eq i32 %"i.2", %"toCheck.1"
  %".12" = zext i1 %".11" to i32
  %"ifcond" = icmp ne i32 %".12", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
while.end:
  ;  Source: return0;
  ret i32 0
if.then:
  ret i32 1
if.end:
  %"i.3" = load i32, i32* %"i"
  %".15" = load i32, i32* %"i"
  %".16" = add i32 %".15", 1
  store i32 %".16", i32* %"i"
  br label %"while.cond"
}

define i32 @"main"()
{
entry:
  %"boolean" = alloca i32
  %".2" = call i32 @"forLoopCheck"(i32 5, i32 10)
  store i32 %".2", i32* %"boolean"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: boolean
  %"boolean.1" = load i32, i32* %"boolean"
  ;  Source: printf("%d",boolean);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"boolean.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"