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

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"square"(i32 %".1")
{
entry:
  %"x" = alloca i32
  store i32 %".1", i32* %"x"
  ;  Source: returnx*x;
  %"x.1" = load i32, i32* %"x"
  %"x.2" = load i32, i32* %"x"
  %".5" = mul i32 %"x.1", %"x.2"
  ret i32 %".5"
}

define i32 @"sumOfSquares"(i32 %".1", i32 %".2")
{
entry:
  %"a" = alloca i32
  store i32 %".1", i32* %"a"
  %"b" = alloca i32
  store i32 %".2", i32* %"b"
  ;  Source: returnsquare(a)+square(b);
  %"a.1" = load i32, i32* %"a"
  %".7" = call i32 @"square"(i32 %"a.1")
  %"b.1" = load i32, i32* %"b"
  %".8" = call i32 @"square"(i32 %"b.1")
  %".9" = add i32 %".7", %".8"
  ret i32 %".9"
}

define i32 @"main"()
{
entry:
  %".2" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: sumOfSquares(3,4)
  %".4" = call i32 @"sumOfSquares"(i32 3, i32 4)
  ;  Source: printf("%d\n",sumOfSquares(3,4));
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 %".4")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"