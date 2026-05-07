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
  ;  Source: inti=0;
  store i32 0, i32* %"i"
  %"j" = alloca i32
  ;  Source: intj;
  ;  Source: j
  %"j.1" = load i32, i32* %"j"
  ;  Source: j=0
  store i32 0, i32* %"j"
  br label %"while.cond"
while.cond:
  %"j.2" = load i32, i32* %"j"
  %".9" = icmp slt i32 %"j.2", 10
  %".10" = zext i1 %".9" to i32
  %"whilecond" = icmp ne i32 %".10", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".12" = bitcast [3 x i8]* @"str" to i8*
  %"j.3" = load i32, i32* %"j"
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"j.3")
  %"j.4" = load i32, i32* %"j"
  %".14" = load i32, i32* %"j"
  %".15" = add i32 %".14", 1
  store i32 %".15", i32* %"j"
  br label %"while.cond"
while.end:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"