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
  %"a" = alloca i32
  store i32 0, i32* %"a"
  ;  Source: while(1){if(a%2==1){a++;continue;}printf("%d",a);if(a>10){break;}a++;}
  br label %"while.cond"
while.cond:
  %"whilecond" = icmp ne i32 1, 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"a.1" = load i32, i32* %"a"
  %".6" = srem i32 %"a.1", 2
  %".7" = icmp eq i32 %".6", 1
  %".8" = zext i1 %".7" to i32
  %"ifcond" = icmp ne i32 %".8", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
while.end:
  %".24" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: printf("%d",1);
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 1)
  ;  Source: return0;
  ret i32 0
if.then:
  %"a.2" = load i32, i32* %"a"
  %".10" = load i32, i32* %"a"
  %".11" = add i32 %".10", 1
  store i32 %".11", i32* %"a"
  br label %"while.cond"
if.end:
  %".14" = bitcast [3 x i8]* @"str" to i8*
  %"a.3" = load i32, i32* %"a"
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"a.3")
  %"a.4" = load i32, i32* %"a"
  %".16" = icmp sgt i32 %"a.4", 10
  %".17" = zext i1 %".16" to i32
  %"ifcond.1" = icmp ne i32 %".17", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.end.1"
if.then.1:
  br label %"while.end"
if.end.1:
  %"a.5" = load i32, i32* %"a"
  %".20" = load i32, i32* %"a"
  %".21" = add i32 %".20", 1
  store i32 %".21", i32* %"a"
  br label %"while.cond"
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"