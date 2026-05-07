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

define i32 @"f"(i32 %".1")
{
entry:
  %"a" = alloca i32
  store i32 %".1", i32* %"a"
  ;  Source: if(a<2){returna;}else{returnf(a-1)+f(a-2);}
  %"a.1" = load i32, i32* %"a"
  %".5" = icmp slt i32 %"a.1", 2
  %".6" = zext i1 %".5" to i32
  %"ifcond" = icmp ne i32 %".6", 0
  br i1 %"ifcond", label %"if.then", label %"if.else"
if.then:
  %"a.2" = load i32, i32* %"a"
  ret i32 %"a.2"
if.end:
  ret i32 0
if.else:
  %"a.3" = load i32, i32* %"a"
  %".9" = sub i32 %"a.3", 1
  %".10" = call i32 @"f"(i32 %".9")
  %"a.4" = load i32, i32* %"a"
  %".11" = sub i32 %"a.4", 2
  %".12" = call i32 @"f"(i32 %".11")
  %".13" = add i32 %".10", %".12"
  ret i32 %".13"
}

define i32 @"main"()
{
entry:
  %"n" = alloca i32
  ;  Source: intn;
  %".3" = bitcast [16 x i8]* @"str" to i8*
  ;  Source: printf("Enter a number:");
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".3")
  ;  Source: n
  %"n.1" = load i32, i32* %"n"
  ;  Source: n=20;
  store i32 20, i32* %"n"
  %"i" = alloca i32
  ;  Source: inti=1;
  store i32 1, i32* %"i"
  ;  Source: while(i++<=n){printf("fib(%d)\t= %d;\n",i,f(i));}
  br label %"while.cond"
while.cond:
  %"i.1" = load i32, i32* %"i"
  %".13" = load i32, i32* %"i"
  %".14" = add i32 %".13", 1
  store i32 %".14", i32* %"i"
  %"n.2" = load i32, i32* %"n"
  %".16" = icmp sle i32 %".13", %"n.2"
  %".17" = zext i1 %".16" to i32
  %"whilecond" = icmp ne i32 %".17", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".19" = bitcast [15 x i8]* @"str.1" to i8*
  %"i.2" = load i32, i32* %"i"
  %"i.3" = load i32, i32* %"i"
  %".20" = call i32 @"f"(i32 %"i.3")
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %"i.2", i32 %".20")
  br label %"while.cond"
while.end:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [16 x i8] c"Enter a number:\00"
@"str.1" = internal constant [15 x i8] c"fib(%d)\09= %d;\0a\00"