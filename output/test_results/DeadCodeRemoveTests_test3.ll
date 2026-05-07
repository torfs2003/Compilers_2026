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
  %"a" = alloca i32
  ;  Source: inta=0;
  store i32 0, i32* %"a"
  ;  Source: while(a<5){a++;continue;intc=0;if(a>4){intq=0;if(a>5){intz=0;}}}
  br label %"while.cond"
while.cond:
  %"a.1" = load i32, i32* %"a"
  %".6" = icmp slt i32 %"a.1", 5
  %".7" = zext i1 %".6" to i32
  %"whilecond" = icmp ne i32 %".7", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"a.2" = load i32, i32* %"a"
  %".9" = load i32, i32* %"a"
  %".10" = add i32 %".9", 1
  store i32 %".10", i32* %"a"
  br label %"while.cond"
while.end:
  ;  Source: return0;
  ret i32 0
}
