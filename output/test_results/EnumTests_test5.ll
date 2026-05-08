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
  %"status" = alloca i32
  store i32 1, i32* %"status"
  %"x" = alloca i32
  %"status_load" = load i32, i32* %"status"
  %".3" = add i32 1, %"status_load"
  %".4" = add i32 %".3", 2
  store i32 %".4", i32* %"x"
  ;  User Comment: /* Note: unscoped access of enum constants! */
  ;  Source: while(x<10){intresult=x*2;if(x>5){result=result*x;}printf("%d",result);/* show the result */x=x+1;}
  br label %"while.cond"
while.cond:
  %"x_load" = load i32, i32* %"x"
  %".9" = icmp slt i32 %"x_load", 10
  %".10" = zext i1 %".9" to i32
  %"whilecond" = icmp ne i32 %".10", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"result" = alloca i32
  %"x_load.1" = load i32, i32* %"x"
  %".12" = mul i32 %"x_load.1", 2
  store i32 %".12", i32* %"result"
  %"x_load.2" = load i32, i32* %"x"
  %".14" = icmp sgt i32 %"x_load.2", 5
  %".15" = zext i1 %".14" to i32
  %"ifcond" = icmp ne i32 %".15", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
while.end:
  ;  Source: return0;
  ret i32 0
if.then:
  %"result_load" = load i32, i32* %"result"
  %"x_load.3" = load i32, i32* %"x"
  %".17" = mul i32 %"result_load", %"x_load.3"
  %"result_load.1" = load i32, i32* %"result"
  store i32 %".17", i32* %"result"
  br label %"if.end"
if.end:
  %".20" = bitcast [3 x i8]* @"str" to i8*
  %"result_load.2" = load i32, i32* %"result"
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %"result_load.2")
  %"x_load.4" = load i32, i32* %"x"
  %".22" = add i32 %"x_load.4", 1
  %"x_load.5" = load i32, i32* %"x"
  store i32 %".22", i32* %"x"
  br label %"while.cond"
}

@"str" = internal constant [3 x i8] c"%d\00"