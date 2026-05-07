; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
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
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.1" = load i32, i32* %"i"
  %".4" = icmp slt i32 %"i.1", 5
  %".5" = zext i1 %".4" to i32
  %"whilecond" = icmp ne i32 %".5", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".7" = bitcast [3 x i8]* @"str" to i8*
  %"i.2" = load i32, i32* %"i"
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %"i.2")
  %"i.3" = load i32, i32* %"i"
  %".9" = load i32, i32* %"i"
  %".10" = add i32 %".9", 1
  store i32 %".10", i32* %"i"
  br label %"while.cond"
while.end:
  ;  Source: inti=5;
  store i32 5, i32* %"i"
  %".15" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: i
  %"i.4" = load i32, i32* %"i"
  ;  Source: printf("%d",i);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %"i.4")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"