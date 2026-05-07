; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"i" = alloca i32
  ;  Source: inti;
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: i=0
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.2" = load i32, i32* %"i"
  %".7" = icmp slt i32 %"i.2", 5
  %".8" = zext i1 %".7" to i32
  %"whilecond" = icmp ne i32 %".8", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"loopVar" = alloca i32
  %"i.3" = load i32, i32* %"i"
  %".10" = mul i32 %"i.3", 10
  store i32 %".10", i32* %"loopVar"
  %".12" = bitcast [19 x i8]* @"str" to i8*
  %"loopVar.1" = load i32, i32* %"loopVar"
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"loopVar.1")
  %"i.4" = load i32, i32* %"i"
  %".14" = load i32, i32* %"i"
  %".15" = add i32 %".14", 1
  store i32 %".15", i32* %"i"
  br label %"while.cond"
while.end:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [19 x i8] c"Loop variable: %d\0a\00"