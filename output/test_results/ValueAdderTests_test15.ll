; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"loopConst" = alloca i32
  store i32 5, i32* %"loopConst"
  %"result" = alloca i32
  store i32 0, i32* %"result"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.1" = load i32, i32* %"i"
  %"loopConst.1" = load i32, i32* %"loopConst"
  %".6" = icmp slt i32 %"i.1", %"loopConst.1"
  %".7" = zext i1 %".6" to i32
  %"whilecond" = icmp ne i32 %".7", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"result.1" = load i32, i32* %"result"
  %"loopConst.2" = load i32, i32* %"loopConst"
  %".9" = add i32 %"result.1", %"loopConst.2"
  %"result.2" = load i32, i32* %"result"
  store i32 %".9", i32* %"result"
  %"i.2" = load i32, i32* %"i"
  %".11" = load i32, i32* %"i"
  %".12" = add i32 %".11", 1
  store i32 %".12", i32* %"i"
  br label %"while.cond"
while.end:
  %".15" = bitcast [12 x i8]* @"str" to i8*
  ;  Source: result
  %"result.3" = load i32, i32* %"result"
  ;  Source: printf("Result: %d\n",result);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %"result.3")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [12 x i8] c"Result: %d\0a\00"