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
  %"i" = alloca i32
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: i=0
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.2" = load i32, i32* %"i"
  %".6" = icmp slt i32 %"i.2", 5
  %".7" = zext i1 %".6" to i32
  %"whilecond" = icmp ne i32 %".7", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"loopVar" = alloca i32
  %"i.3" = load i32, i32* %"i"
  %".9" = mul i32 %"i.3", 10
  store i32 %".9", i32* %"loopVar"
  %".11" = bitcast [19 x i8]* @"str" to i8*
  %"loopVar.1" = load i32, i32* %"loopVar"
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %"loopVar.1")
  %"i.4" = load i32, i32* %"i"
  %".13" = load i32, i32* %"i"
  %".14" = add i32 %".13", 1
  store i32 %".14", i32* %"i"
  br label %"while.cond"
while.end:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [19 x i8] c"Loop variable: %d\0a\00"