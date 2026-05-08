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
  %"loopConst" = alloca i32
  store i32 5, i32* %"loopConst"
  %"result" = alloca i32
  store i32 0, i32* %"result"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i_load" = load i32, i32* %"i"
  %".6" = icmp slt i32 %"i_load", 5
  %".7" = zext i1 %".6" to i32
  %"whilecond" = icmp ne i32 %".7", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"result_load" = load i32, i32* %"result"
  %".9" = add i32 %"result_load", 5
  %"result_load.1" = load i32, i32* %"result"
  store i32 %".9", i32* %"result"
  %"i_load.1" = load i32, i32* %"i"
  %".11" = load i32, i32* %"i"
  %".12" = add i32 %".11", 1
  store i32 %".12", i32* %"i"
  br label %"while.cond"
while.end:
  %".15" = bitcast [12 x i8]* @"str" to i8*
  ;  Source: result
  %"result_load.2" = load i32, i32* %"result"
  ;  Source: printf("Result: %d\n",result);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %"result_load.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [12 x i8] c"Result: %d\0a\00"