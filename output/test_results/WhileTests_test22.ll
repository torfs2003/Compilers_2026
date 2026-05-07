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
  %"i" = alloca i32
  ;  Source: inti=0;
  store i32 0, i32* %"i"
  ;  Source: while(i<10){printf("%d\n",i);if(i==5){break;}else{i++;continue;}i=10;}
  br label %"while.cond"
while.cond:
  %"i.1" = load i32, i32* %"i"
  %".6" = icmp slt i32 %"i.1", 10
  %".7" = zext i1 %".6" to i32
  %"whilecond" = icmp ne i32 %".7", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".9" = bitcast [4 x i8]* @"str" to i8*
  %"i.2" = load i32, i32* %"i"
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %"i.2")
  %"i.3" = load i32, i32* %"i"
  %".11" = icmp eq i32 %"i.3", 5
  %".12" = zext i1 %".11" to i32
  %"ifcond" = icmp ne i32 %".12", 0
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
  %".15" = load i32, i32* %"i"
  %".16" = add i32 %".15", 1
  store i32 %".16", i32* %"i"
  br label %"while.cond"
}

@"str" = internal constant [4 x i8] c"%d\0a\00"