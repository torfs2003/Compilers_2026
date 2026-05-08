; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"mul"(i32 %".1", i32 %".2")
{
entry:
  %"x" = alloca i32
  store i32 %".1", i32* %"x"
  %"y" = alloca i32
  store i32 %".2", i32* %"y"
  ;  Source: returnx*y;
  %"x_load" = load i32, i32* %"x"
  %"y_load" = load i32, i32* %"y"
  %".7" = mul i32 %"x_load", %"y_load"
  ret i32 %".7"
}

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 1, i32* %"x"
  ;  Source: while(x<10){intresult=mul(x,2);if(x>5){result=mul(result,x);}printf("%d",mul(result,x));x=x+1;}
  br label %"while.cond"
while.cond:
  %"x_load" = load i32, i32* %"x"
  %".5" = icmp slt i32 %"x_load", 10
  %".6" = zext i1 %".5" to i32
  %"whilecond" = icmp ne i32 %".6", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"result" = alloca i32
  %"x_load.1" = load i32, i32* %"x"
  %".8" = call i32 @"mul"(i32 %"x_load.1", i32 2)
  store i32 %".8", i32* %"result"
  %"x_load.2" = load i32, i32* %"x"
  %".10" = icmp sgt i32 %"x_load.2", 5
  %".11" = zext i1 %".10" to i32
  %"ifcond" = icmp ne i32 %".11", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
while.end:
  ;  Source: return0;
  ret i32 0
if.then:
  %"result_load" = load i32, i32* %"result"
  %"x_load.3" = load i32, i32* %"x"
  %".13" = call i32 @"mul"(i32 %"result_load", i32 %"x_load.3")
  %"result_load.1" = load i32, i32* %"result"
  store i32 %".13", i32* %"result"
  br label %"if.end"
if.end:
  %".16" = bitcast [3 x i8]* @"str" to i8*
  %"result_load.2" = load i32, i32* %"result"
  %"x_load.4" = load i32, i32* %"x"
  %".17" = call i32 @"mul"(i32 %"result_load.2", i32 %"x_load.4")
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 %".17")
  %"x_load.5" = load i32, i32* %"x"
  %".19" = add i32 %"x_load.5", 1
  %"x_load.6" = load i32, i32* %"x"
  store i32 %".19", i32* %"x"
  br label %"while.cond"
}

@"str" = internal constant [3 x i8] c"%d\00"