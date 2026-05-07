; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"mul"(i32 %".1", i32 %".2")
{
entry:
  %"x" = alloca i32
  store i32 %".1", i32* %"x"
  %"y" = alloca i32
  store i32 %".2", i32* %"y"
  ;  Source: returnx*y;
  %"x.1" = load i32, i32* %"x"
  %"y.1" = load i32, i32* %"y"
  %".7" = mul i32 %"x.1", %"y.1"
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
  %"some_value.1" = load i32, i32* %"some_value"
  %"val.1" = load i32, i32* %"val"
  %".4" = icmp ne i32 %"some_value.1", 0
  %".5" = icmp ne i32 %"val.1", 0
  %".6" = and i1 %".4", %".5"
  %".7" = zext i1 %".6" to i32
  store i32 %".7", i32* %"another_value"
  %"x" = alloca i32
  store i32 1, i32* %"x"
  ;  Source: while(x<10){intresult=mul(x,2);if(x>5){result=mul(result,x);}printf("%d",result);/* show the result */x=x+1;}
  br label %"while.cond"
while.cond:
  %"x.1" = load i32, i32* %"x"
  %".12" = icmp slt i32 %"x.1", 10
  %".13" = zext i1 %".12" to i32
  %"whilecond" = icmp ne i32 %".13", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"result" = alloca i32
  %"x.2" = load i32, i32* %"x"
  %".15" = call i32 @"mul"(i32 %"x.2", i32 2)
  store i32 %".15", i32* %"result"
  %"x.3" = load i32, i32* %"x"
  %".17" = icmp sgt i32 %"x.3", 5
  %".18" = zext i1 %".17" to i32
  %"ifcond" = icmp ne i32 %".18", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
while.end:
  ;  Source: return0;
  ret i32 0
if.then:
  %"result.1" = load i32, i32* %"result"
  %"x.4" = load i32, i32* %"x"
  %".20" = call i32 @"mul"(i32 %"result.1", i32 %"x.4")
  %"result.2" = load i32, i32* %"result"
  store i32 %".20", i32* %"result"
  br label %"if.end"
if.end:
  %".23" = bitcast [3 x i8]* @"str" to i8*
  %"result.3" = load i32, i32* %"result"
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %"result.3")
  %"x.5" = load i32, i32* %"x"
  %".25" = add i32 %"x.5", 1
  %"x.6" = load i32, i32* %"x"
  store i32 %".25", i32* %"x"
  br label %"while.cond"
}

@"str" = internal constant [3 x i8] c"%d\00"