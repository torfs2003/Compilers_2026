; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
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
  ;  Source: while(1){inta=0;printf("%d",1);break;}
  br label %"while.cond"
while.cond:
  %"whilecond" = icmp ne i32 1, 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"a" = alloca i32
  store i32 0, i32* %"a"
  %".6" = bitcast [3 x i8]* @"str" to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 1)
  br label %"while.end"
while.end:
  %".9" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: printf("%d",2);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 2)
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"