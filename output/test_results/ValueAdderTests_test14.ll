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

@"globalConst" = internal global i32 100
define i32 @"computeSomething"()
{
entry:
  ;  Source: returnglobalConst+10;
  %"globalConst" = load i32, i32* @"globalConst"
  %".3" = add i32 %"globalConst", 10
  ret i32 %".3"
}

define i32 @"computeSomethingElse"()
{
entry:
  ;  Source: returnglobalConst*2;
  %"globalConst" = load i32, i32* @"globalConst"
  %".3" = mul i32 %"globalConst", 2
  ret i32 %".3"
}

define i32 @"main"()
{
entry:
  %".2" = bitcast [14 x i8]* @"str" to i8*
  ;  Source: computeSomething()
  %".4" = call i32 @"computeSomething"()
  ;  Source: printf("Result 1: %d\n",computeSomething());
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 %".4")
  %".7" = bitcast [14 x i8]* @"str.1" to i8*
  ;  Source: computeSomethingElse()
  %".9" = call i32 @"computeSomethingElse"()
  ;  Source: printf("Result 2: %d\n",computeSomethingElse());
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %".9")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [14 x i8] c"Result 1: %d\0a\00"
@"str.1" = internal constant [14 x i8] c"Result 2: %d\0a\00"