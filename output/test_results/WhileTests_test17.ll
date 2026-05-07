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
  store i32 0, i32* %"i"
  ;  Source: while(i<5){i++;printf("%d;",i);}
  br label %"while.cond"
while.cond:
  %"i.1" = load i32, i32* %"i"
  %".5" = icmp slt i32 %"i.1", 5
  %".6" = zext i1 %".5" to i32
  %"whilecond" = icmp ne i32 %".6", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"i.2" = load i32, i32* %"i"
  %".8" = load i32, i32* %"i"
  %".9" = add i32 %".8", 1
  store i32 %".9", i32* %"i"
  %".11" = bitcast [4 x i8]* @"str" to i8*
  %"i.3" = load i32, i32* %"i"
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %"i.3")
  br label %"while.cond"
while.end:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d;\00"