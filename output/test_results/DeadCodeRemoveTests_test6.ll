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
  ;  Source: while(a<5){a++;intc=0;if(a>4){intq=0;if(a>5){intz=0;}}break;if(a<3){if(a==3){while(a<5){break;intw=0;}}}}
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
  %"c" = alloca i32
  store i32 0, i32* %"c"
  %"a.3" = load i32, i32* %"a"
  %".12" = icmp sgt i32 %"a.3", 4
  %".13" = zext i1 %".12" to i32
  %"ifcond" = icmp ne i32 %".13", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
while.end:
  ;  Source: return0;
  ret i32 0
if.then:
  %"q" = alloca i32
  store i32 0, i32* %"q"
  %"a.4" = load i32, i32* %"a"
  %".16" = icmp sgt i32 %"a.4", 5
  %".17" = zext i1 %".16" to i32
  %"ifcond.1" = icmp ne i32 %".17", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.end.1"
if.end:
  br label %"while.end"
if.then.1:
  %"z" = alloca i32
  store i32 0, i32* %"z"
  br label %"if.end.1"
if.end.1:
  br label %"if.end"
}
