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
  %"i" = alloca i32
  ;  User Comment: /* this should print the numbers: 0, 1, 2, 3, 4, 5 */
  ;  Source: inti=0;
  store i32 0, i32* %"i"
  ;  Source: while(i<10){printf("%d\n",i);if(i==5){break;}else{i++;continue;}i=10;}
  br label %"while.cond"
while.cond:
  %"i.1" = load i32, i32* %"i"
  %".7" = icmp slt i32 %"i.1", 10
  %".8" = zext i1 %".7" to i32
  %"whilecond" = icmp ne i32 %".8", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".10" = bitcast [4 x i8]* @"str" to i8*
  %"i.2" = load i32, i32* %"i"
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %"i.2")
  %"i.3" = load i32, i32* %"i"
  %".12" = icmp eq i32 %"i.3", 5
  %".13" = zext i1 %".12" to i32
  %"ifcond" = icmp ne i32 %".13", 0
  br i1 %"ifcond", label %"if.then", label %"if.else"
while.end:
  ;  Source: return0;
  ret i32 0
if.then:
  br label %"while.end"
if.end:
  %"i.5" = load i32, i32* %"i"
  store i32 10, i32* %"i"
  br label %"while.cond"
if.else:
  %"i.4" = load i32, i32* %"i"
  %".16" = load i32, i32* %"i"
  %".17" = add i32 %".16", 1
  store i32 %".17", i32* %"i"
  br label %"while.cond"
}

@"str" = internal constant [4 x i8] c"%d\0a\00"