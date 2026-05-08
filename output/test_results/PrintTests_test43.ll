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
  %"val" = alloca i32
  store i32 0, i32* %"val"
  %"some_value" = alloca i32
  store i32 1, i32* %"some_value"
  %"another_value" = alloca i32
  %"some_value_load" = load i32, i32* %"some_value"
  %"val_load" = load i32, i32* %"val"
  %".4" = icmp ne i32 %"some_value_load", 0
  %".5" = icmp ne i32 %"val_load", 0
  %".6" = and i1 %".4", %".5"
  %".7" = zext i1 %".6" to i32
  store i32 %".7", i32* %"another_value"
  %"x" = alloca i32
  store i32 1, i32* %"x"
  ;  Source: while(x<10){intresult=mul(x,2);if(x>5){result=mul(result,x);}printf("%d",result);/* show the result */x=x+1;}
  br label %"while.cond"
while.cond:
  %"x_load" = load i32, i32* %"x"
  %".12" = icmp slt i32 %"x_load", 10
  %".13" = zext i1 %".12" to i32
  %"whilecond" = icmp ne i32 %".13", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"result" = alloca i32
  %"x_load.1" = load i32, i32* %"x"
  %".15" = call i32 @"mul"(i32 %"x_load.1", i32 2)
  store i32 %".15", i32* %"result"
  %"x_load.2" = load i32, i32* %"x"
  %".17" = icmp sgt i32 %"x_load.2", 5
  %".18" = zext i1 %".17" to i32
  %"ifcond" = icmp ne i32 %".18", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
while.end:
  ;  Source: return0;
  ret i32 0
if.then:
  %"result_load" = load i32, i32* %"result"
  %"x_load.3" = load i32, i32* %"x"
  %".20" = call i32 @"mul"(i32 %"result_load", i32 %"x_load.3")
  %"result_load.1" = load i32, i32* %"result"
  store i32 %".20", i32* %"result"
  br label %"if.end"
if.end:
  %".23" = bitcast [3 x i8]* @"str" to i8*
  %"result_load.2" = load i32, i32* %"result"
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %"result_load.2")
  %"x_load.4" = load i32, i32* %"x"
  %".25" = add i32 %"x_load.4", 1
  %"x_load.5" = load i32, i32* %"x"
  store i32 %".25", i32* %"x"
  br label %"while.cond"
}

@"str" = internal constant [3 x i8] c"%d\00"