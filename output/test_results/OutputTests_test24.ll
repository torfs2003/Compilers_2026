; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"innerFunction"()
{
entry:
  %"y" = alloca i32
  %"x_load" = load i32, i32* @"x"
  %".2" = sdiv i32 %"x_load", 4
  store i32 %".2", i32* %"y"
  %"x" = alloca i32
  store i32 25, i32* %"x"
  %".5" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: y
  %"y_load" = load i32, i32* %"y"
  ;  Source: printf("%d\n",y);
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %"y_load")
  %".9" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: x
  %"x_load.1" = load i32, i32* %"x"
  ;  Source: printf("%d\n",x);
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %"x_load.1")
  ;  Source: return0;
  ret i32 0
}

define i8 @"outerFunction"()
{
entry:
  %"y" = alloca i32
  %"x_load" = load i32, i32* @"x"
  %".2" = sdiv i32 %"x_load", 2
  store i32 %".2", i32* %"y"
  %"x" = alloca i32
  store i32 50, i32* %"x"
  %".5" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: y
  %"y_load" = load i32, i32* %"y"
  ;  Source: printf("%d\n",y);
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %"y_load")
  %".9" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: x
  %"x_load.1" = load i32, i32* %"x"
  ;  Source: printf("%d\n",x);
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %"x_load.1")
  ;  Source: innerFunction();
  %".14" = call i32 @"innerFunction"()
  ;  Source: return0;
  %".16" = trunc i32 0 to i8
  ret i8 %".16"
}

define i32 @"main"()
{
entry:
  %".2" = bitcast [4 x i8]* @"str.4" to i8*
  ;  Source: x
  %"x_load" = load i32, i32* @"x"
  ;  Source: printf("%d\n",x);
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 %"x_load")
  ;  Source: outerFunction();
  %".7" = call i8 @"outerFunction"()
  %".8" = bitcast [4 x i8]* @"str.5" to i8*
  ;  Source: x
  %"x_load.1" = load i32, i32* @"x"
  ;  Source: printf("%d\n",x);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"x_load.1")
  ;  Source: return0;
  ret i32 0
}

@"x" = internal global i32 100
@"str" = internal constant [4 x i8] c"%d\0a\00"
@"str.1" = internal constant [4 x i8] c"%d\0a\00"
@"str.2" = internal constant [4 x i8] c"%d\0a\00"
@"str.3" = internal constant [4 x i8] c"%d\0a\00"
@"str.4" = internal constant [4 x i8] c"%d\0a\00"
@"str.5" = internal constant [4 x i8] c"%d\0a\00"