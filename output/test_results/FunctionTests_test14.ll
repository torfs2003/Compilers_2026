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

define i32 @"factorial"(i32 %".1")
{
entry:
  %"n" = alloca i32
  store i32 %".1", i32* %"n"
  ;  Source: if(n==0){return1;}else{returnn*factorial(n-1);}
  %"n.1" = load i32, i32* %"n"
  %".5" = icmp eq i32 %"n.1", 0
  %".6" = zext i1 %".5" to i32
  %"ifcond" = icmp ne i32 %".6", 0
  br i1 %"ifcond", label %"if.then", label %"if.else"
if.then:
  ret i32 1
if.end:
  ret i32 0
if.else:
  %"n.2" = load i32, i32* %"n"
  %"n.3" = load i32, i32* %"n"
  %".9" = sub i32 %"n.3", 1
  %".10" = call i32 @"factorial"(i32 %".9")
  %".11" = mul i32 %"n.2", %".10"
  ret i32 %".11"
}

define i32 @"main"()
{
entry:
  %"n" = alloca i32
  ;  Source: intn=5;
  store i32 5, i32* %"n"
  %".4" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: n
  %"n.1" = load i32, i32* %"n"
  ;  Source: factorial(n)
  %".7" = call i32 @"factorial"(i32 %"n.1")
  ;  Source: printf("%d\n",factorial(n));
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %".7")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"