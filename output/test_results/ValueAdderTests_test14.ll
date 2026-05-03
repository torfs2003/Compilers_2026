; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

@"globalConst" = internal global i32 100
define i32 @"computeSomething"()
{
entry:
  ;  Source: returnglobalConst+10;
  ret i32 110
}

define i32 @"computeSomethingElse"()
{
entry:
  ;  Source: returnglobalConst*2;
  ret i32 200
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