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

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  ;  Source: while(1){inta=0;if(a%2==1){continue;intc=0;}printf("%d",a);if(a>10){break;intg=0;}a++;}
  br label %"while.cond"
while.cond:
  %"whilecond" = icmp ne i32 1, 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"a" = alloca i32
  store i32 0, i32* %"a"
  %"a.1" = load i32, i32* %"a"
  %".6" = srem i32 %"a.1", 2
  %".7" = icmp eq i32 %".6", 1
  %".8" = zext i1 %".7" to i32
  %"ifcond" = icmp ne i32 %".8", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
while.end:
  %".21" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: printf("%d",1);
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 1)
  ;  Source: return0;
  ret i32 0
if.then:
  br label %"while.cond"
if.end:
  %".11" = bitcast [3 x i8]* @"str" to i8*
  %"a.2" = load i32, i32* %"a"
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %"a.2")
  %"a.3" = load i32, i32* %"a"
  %".13" = icmp sgt i32 %"a.3", 10
  %".14" = zext i1 %".13" to i32
  %"ifcond.1" = icmp ne i32 %".14", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.end.1"
if.then.1:
  br label %"while.end"
if.end.1:
  %"a.4" = load i32, i32* %"a"
  %".17" = load i32, i32* %"a"
  %".18" = add i32 %".17", 1
  store i32 %".18", i32* %"a"
  br label %"while.cond"
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"