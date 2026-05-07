; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"i" = alloca i32
  ;  Source: inti=0;
  store i32 0, i32* %"i"
  ;  Source: while(i<5){i++;printf("%d;",i);}
  br label %"while.cond"
while.cond:
  %"i.1" = load i32, i32* %"i"
  %".6" = icmp slt i32 %"i.1", 5
  %".7" = zext i1 %".6" to i32
  %"whilecond" = icmp ne i32 %".7", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"i.2" = load i32, i32* %"i"
  %".9" = load i32, i32* %"i"
  %".10" = add i32 %".9", 1
  store i32 %".10", i32* %"i"
  %".12" = bitcast [4 x i8]* @"str" to i8*
  %"i.3" = load i32, i32* %"i"
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"i.3")
  br label %"while.cond"
while.end:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d;\00"