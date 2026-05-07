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
  %"status" = alloca i32
  ;  Source: enumSYS_IO_ReceiverStatusBitstatus=BUSY;
  store i32 1, i32* %"status"
  %"x" = alloca i32
  ;  Source: status
  %"status.1" = load i32, i32* %"status"
  %".5" = add i32 1, %"status.1"
  ;  Source: 1+status+OFFLINE
  %".7" = add i32 %".5", 2
  ;  Source: intx=1+status+OFFLINE;
  store i32 %".7", i32* %"x"
  ;  User Comment: /* Note: unscoped access of enum constants! */
  ;  Source: while(x<10){intresult=x*2;if(x>5){result=result*x;}printf("%d",result);/* show the result */x=x+1;}
  br label %"while.cond"
while.cond:
  %"x.1" = load i32, i32* %"x"
  %".13" = icmp slt i32 %"x.1", 10
  %".14" = zext i1 %".13" to i32
  %"whilecond" = icmp ne i32 %".14", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"result" = alloca i32
  %"x.2" = load i32, i32* %"x"
  %".16" = mul i32 %"x.2", 2
  store i32 %".16", i32* %"result"
  %"x.3" = load i32, i32* %"x"
  %".18" = icmp sgt i32 %"x.3", 5
  %".19" = zext i1 %".18" to i32
  %"ifcond" = icmp ne i32 %".19", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
while.end:
  ;  Source: return0;
  ret i32 0
if.then:
  %"result.1" = load i32, i32* %"result"
  %"x.4" = load i32, i32* %"x"
  %".21" = mul i32 %"result.1", %"x.4"
  %"result.2" = load i32, i32* %"result"
  store i32 %".21", i32* %"result"
  br label %"if.end"
if.end:
  %".24" = bitcast [3 x i8]* @"str" to i8*
  %"result.3" = load i32, i32* %"result"
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 %"result.3")
  %"x.5" = load i32, i32* %"x"
  %".26" = add i32 %"x.5", 1
  %"x.6" = load i32, i32* %"x"
  store i32 %".26", i32* %"x"
  br label %"while.cond"
}

@"str" = internal constant [3 x i8] c"%d\00"