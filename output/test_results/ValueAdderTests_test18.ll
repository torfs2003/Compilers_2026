; ModuleID = "cmm_module"
<<<<<<< HEAD
target triple = "x86_64-w64-windows-gnu"
=======
target triple = "x86_64-unknown-linux-gnu"
>>>>>>> origin/main
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
  %"incr" = alloca i32
  ;  Source: constintincr=5;
  store i32 5, i32* %"incr"
  %"ptr" = alloca i32*
  ;  Source: incr
  %"incr.1" = load i32, i32* %"incr"
  ;  Source: &incr
  ;  Source: int*ptr=&incr;
  store i32* %"incr", i32** %"ptr"
  %"sum" = alloca i32
  ;  Source: intsum=0;
  store i32 0, i32* %"sum"
  %"i" = alloca i32
  ;  Source: inti;
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: i=0
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.2" = load i32, i32* %"i"
  %".15" = icmp slt i32 %"i.2", 10
  %".16" = zext i1 %".15" to i32
  %"whilecond" = icmp ne i32 %".16", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"sum.1" = load i32, i32* %"sum"
  %"incr.2" = load i32, i32* %"incr"
  %".18" = add i32 %"sum.1", %"incr.2"
  %"sum.2" = load i32, i32* %"sum"
  store i32 %".18", i32* %"sum"
  %"i.3" = load i32, i32* %"i"
  %".20" = load i32, i32* %"i"
  %".21" = add i32 %".20", 1
  store i32 %".21", i32* %"i"
  br label %"while.cond"
while.end:
  %".24" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: sum
  %"sum.3" = load i32, i32* %"sum"
  ;  Source: printf("%d",sum);
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 %"sum.3")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"