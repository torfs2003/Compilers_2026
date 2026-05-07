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
  %"loopConst" = alloca i32
  ;  Source: constintloopConst=5;
  store i32 5, i32* %"loopConst"
  %"result" = alloca i32
  ;  Source: intresult=0;
  store i32 0, i32* %"result"
  %"i" = alloca i32
  ;  Source: inti=0;
  store i32 0, i32* %"i"
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: i<loopConst
  %".10" = icmp slt i32 %"i.1", 5
  %".11" = zext i1 %".10" to i32
  br label %"while.cond"
while.cond:
  %"i.2" = load i32, i32* %"i"
  %".13" = load i32, i32* %"i"
  %".14" = add i32 %".13", 1
  store i32 %".14", i32* %"i"
  %"whilecond" = icmp ne i32 %".14", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"result.1" = load i32, i32* %"result"
  %".17" = add i32 %"result.1", 5
  %"result.2" = load i32, i32* %"result"
  store i32 %".17", i32* %"result"
  br label %"while.cond"
while.end:
  %".20" = bitcast [12 x i8]* @"str" to i8*
  ;  Source: result
  %"result.3" = load i32, i32* %"result"
  ;  Source: printf("Result: %d\n",result);
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %"result.3")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [12 x i8] c"Result: %d\0a\00"