; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"f"(i32 %".1")
{
entry:
  %"a" = alloca i32
  store i32 %".1", i32* %"a"
  ;  Source: if(a<2){returna;}else{returnf(a-1)+f(a-2);}
  %"a_load" = load i32, i32* %"a"
  %".5" = icmp slt i32 %"a_load", 2
  %".6" = zext i1 %".5" to i32
  %"ifcond" = icmp ne i32 %".6", 0
  br i1 %"ifcond", label %"if.then", label %"if.else"
if.then:
  %"a_load.1" = load i32, i32* %"a"
  ret i32 %"a_load.1"
if.end:
  ret i32 0
if.else:
  %"a_load.2" = load i32, i32* %"a"
  %".9" = sub i32 %"a_load.2", 1
  %".10" = call i32 @"f"(i32 %".9")
  %"a_load.3" = load i32, i32* %"a"
  %".11" = sub i32 %"a_load.3", 2
  %".12" = call i32 @"f"(i32 %".11")
  %".13" = add i32 %".10", %".12"
  ret i32 %".13"
}

define i32 @"main"()
{
entry:
  %"n" = alloca i32
  %".2" = bitcast [16 x i8]* @"str" to i8*
  ;  Source: printf("Enter a number:");
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".2")
  %".5" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: n
  %"n_load" = load i32, i32* %"n"
  ;  Source: &n
  ;  Source: scanf("%d",&n);
  %".9" = call i32 (i8*, ...) @"scanf"(i8* %".5", i32* %"n")
  %"i" = alloca i32
  store i32 1, i32* %"i"
  ;  Source: while(i++<=n){printf("fib(%d)\t= %d;\n",i,f(i));}
  br label %"while.cond"
while.cond:
  %"i_load" = load i32, i32* %"i"
  %".13" = load i32, i32* %"i"
  %".14" = add i32 %".13", 1
  store i32 %".14", i32* %"i"
  %"n_load.1" = load i32, i32* %"n"
  %".16" = icmp sle i32 %".13", %"n_load.1"
  %".17" = zext i1 %".16" to i32
  %"whilecond" = icmp ne i32 %".17", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".19" = bitcast [15 x i8]* @"str.2" to i8*
  %"i_load.1" = load i32, i32* %"i"
  %"i_load.2" = load i32, i32* %"i"
  %".20" = call i32 @"f"(i32 %"i_load.2")
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %"i_load.1", i32 %".20")
  br label %"while.cond"
while.end:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [16 x i8] c"Enter a number:\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [15 x i8] c"fib(%d)\09= %d;\0a\00"