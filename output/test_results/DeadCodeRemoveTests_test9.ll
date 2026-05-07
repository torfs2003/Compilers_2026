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
  ;  Source: while('a'=='a'){printf("infinite loop");}
  br label %"while.cond"
while.cond:
  %".4" = icmp eq i8 97, 97
  %".5" = zext i1 %".4" to i32
  %"whilecond" = icmp ne i32 %".5", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".7" = bitcast [14 x i8]* @"str" to i8*
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".7")
  br label %"while.cond"
while.end:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [14 x i8] c"infinite loop\00"