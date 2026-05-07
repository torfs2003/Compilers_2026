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
  %"i" = alloca i32
  store i32 0, i32* %"i"
  ;  Source: while(i<10){printf("%d\n",i);if(i==5){break;}else{i++;continue;}i=10;}
  br label %"while.cond"
while.cond:
  %"i.1" = load i32, i32* %"i"
  %".5" = icmp slt i32 %"i.1", 10
  %".6" = zext i1 %".5" to i32
  %"whilecond" = icmp ne i32 %".6", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".8" = bitcast [4 x i8]* @"str" to i8*
  %"i.2" = load i32, i32* %"i"
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"i.2")
  %"i.3" = load i32, i32* %"i"
  %".10" = icmp eq i32 %"i.3", 5
  %".11" = zext i1 %".10" to i32
  %"ifcond" = icmp ne i32 %".11", 0
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
  %".14" = load i32, i32* %"i"
  %".15" = add i32 %".14", 1
  store i32 %".15", i32* %"i"
  br label %"while.cond"
}

@"str" = internal constant [4 x i8] c"%d\0a\00"