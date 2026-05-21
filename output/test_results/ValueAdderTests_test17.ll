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
  %"incr" = alloca i32
  store i32 5, i32* %"incr"
  %"sum" = alloca i32
  store i32 0, i32* %"sum"
  %"i" = alloca i32
  ;  Source: i
  %"i_load" = load i32, i32* %"i"
  ;  Source: i=0
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i_load.1" = load i32, i32* %"i"
  %".8" = icmp slt i32 %"i_load.1", 10
  %".9" = zext i1 %".8" to i32
  %"whilecond" = icmp ne i32 %".9", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"sum_load" = load i32, i32* %"sum"
  %".11" = add i32 %"sum_load", 5
  %"sum_load.1" = load i32, i32* %"sum"
  store i32 %".11", i32* %"sum"
  %"i_load.2" = load i32, i32* %"i"
  %".13" = load i32, i32* %"i"
  %".14" = add i32 %".13", 1
  store i32 %".14", i32* %"i"
  br label %"while.cond"
while.end:
  %".17" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: sum
  %"sum_load.2" = load i32, i32* %"sum"
  ;  Source: printf("%d",sum);
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".17", i32 %"sum_load.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"