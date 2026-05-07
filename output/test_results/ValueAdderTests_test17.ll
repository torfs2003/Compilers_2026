; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"incr" = alloca i32
  store i32 5, i32* %"incr"
  %"sum" = alloca i32
  store i32 0, i32* %"sum"
  %"i" = alloca i32
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: i=0
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.2" = load i32, i32* %"i"
  %".8" = icmp slt i32 %"i.2", 10
  %".9" = zext i1 %".8" to i32
  %"whilecond" = icmp ne i32 %".9", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"sum.1" = load i32, i32* %"sum"
  %"incr.1" = load i32, i32* %"incr"
  %".11" = add i32 %"sum.1", %"incr.1"
  %"sum.2" = load i32, i32* %"sum"
  store i32 %".11", i32* %"sum"
  %"i.3" = load i32, i32* %"i"
  %".13" = load i32, i32* %"i"
  %".14" = add i32 %".13", 1
  store i32 %".14", i32* %"i"
  br label %"while.cond"
while.end:
  %".17" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: sum
  %"sum.3" = load i32, i32* %"sum"
  ;  Source: printf("%d",sum);
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".17", i32 %"sum.3")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"