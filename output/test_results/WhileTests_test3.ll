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
  %"a" = alloca i32
  ;  Source: inta=0;
  store i32 0, i32* %"a"
  ;  Source: while(a<30){if((a%2)==0){printf("%d",1);}else{printf("%d",2);}a++;}
  br label %"while.cond"
while.cond:
  %"a.1" = load i32, i32* %"a"
  %".6" = icmp slt i32 %"a.1", 30
  %".7" = zext i1 %".6" to i32
  %"whilecond" = icmp ne i32 %".7", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"a.2" = load i32, i32* %"a"
  %".9" = srem i32 %"a.2", 2
  %".10" = icmp eq i32 %".9", 0
  %".11" = zext i1 %".10" to i32
  %"ifcond" = icmp ne i32 %".11", 0
  br i1 %"ifcond", label %"if.then", label %"if.else"
while.end:
  ;  Source: return0;
  ret i32 0
if.then:
  %".13" = bitcast [3 x i8]* @"str" to i8*
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 1)
  br label %"if.end"
if.end:
  %"a.3" = load i32, i32* %"a"
  %".19" = load i32, i32* %"a"
  %".20" = add i32 %".19", 1
  store i32 %".20", i32* %"a"
  br label %"while.cond"
if.else:
  %".16" = bitcast [3 x i8]* @"str.1" to i8*
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 2)
  br label %"if.end"
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"