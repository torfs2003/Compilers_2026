; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 0, i32* %"a"
  ;  Source: while(a<5){a++;continue;intc=0;if(a>4){intq=0;if(a>5){intz=0;}}}
  br label %"while.cond"
while.cond:
  %"a.1" = load i32, i32* %"a"
  %".5" = icmp slt i32 %"a.1", 5
  %".6" = zext i1 %".5" to i32
  %"whilecond" = icmp ne i32 %".6", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"a.2" = load i32, i32* %"a"
  %".8" = load i32, i32* %"a"
  %".9" = add i32 %".8", 1
  store i32 %".9", i32* %"a"
  br label %"while.cond"
while.end:
  ;  Source: return0;
  ret i32 0
}
