; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"factorial"(i32 %".1")
{
entry:
  %"n" = alloca i32
  store i32 %".1", i32* %"n"
  ;  Source: if(n==0){return1;}
  %"n_load" = load i32, i32* %"n"
  %".5" = icmp eq i32 %"n_load", 0
  %".6" = zext i1 %".5" to i32
  %"ifcond" = icmp ne i32 %".6", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
if.then:
  ret i32 1
if.end:
  ;  Source: returnn*factorial(n-1);
  %"n_load.1" = load i32, i32* %"n"
  %"n_load.2" = load i32, i32* %"n"
  %".10" = sub i32 %"n_load.2", 1
  %".11" = call i32 @"factorial"(i32 %".10")
  %".12" = mul i32 %"n_load.1", %".11"
  ret i32 %".12"
}

define i32 @"fibonacci"(i32 %".1")
{
entry:
  %"n" = alloca i32
  store i32 %".1", i32* %"n"
  ;  Source: if(n<=1){returnn;}
  %"n_load" = load i32, i32* %"n"
  %".5" = icmp sle i32 %"n_load", 1
  %".6" = zext i1 %".5" to i32
  %"ifcond" = icmp ne i32 %".6", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
if.then:
  %"n_load.1" = load i32, i32* %"n"
  ret i32 %"n_load.1"
if.end:
  %"prev" = alloca i32
  store i32 0, i32* %"prev"
  %"curr" = alloca i32
  store i32 1, i32* %"curr"
  %"i" = alloca i32
  store i32 2, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i_load" = load i32, i32* %"i"
  %"n_load.2" = load i32, i32* %"n"
  %".13" = icmp sle i32 %"i_load", %"n_load.2"
  %".14" = zext i1 %".13" to i32
  %"whilecond" = icmp ne i32 %".14", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"next" = alloca i32
  %"prev_load" = load i32, i32* %"prev"
  %"curr_load" = load i32, i32* %"curr"
  %".16" = add i32 %"prev_load", %"curr_load"
  store i32 %".16", i32* %"next"
  %"curr_load.1" = load i32, i32* %"curr"
  %"prev_load.1" = load i32, i32* %"prev"
  store i32 %"curr_load.1", i32* %"prev"
  %"next_load" = load i32, i32* %"next"
  %"curr_load.2" = load i32, i32* %"curr"
  store i32 %"next_load", i32* %"curr"
  %"i_load.1" = load i32, i32* %"i"
  %".20" = load i32, i32* %"i"
  %".21" = add i32 %".20", 1
  store i32 %".21", i32* %"i"
  br label %"while.cond"
while.end:
  ;  Source: returncurr;
  %"curr_load.3" = load i32, i32* %"curr"
  ret i32 %"curr_load.3"
}

define i32 @"main"()
{
entry:
  %".2" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: factorial(5)
  %".4" = call i32 @"factorial"(i32 5)
  ;  Source: printf("%d\n",factorial(5));
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 %".4")
  %".7" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: fibonacci(7)
  %".9" = call i32 @"fibonacci"(i32 7)
  ;  Source: printf("%d\n",fibonacci(7));
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %".9")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"
@"str.1" = internal constant [4 x i8] c"%d\0a\00"