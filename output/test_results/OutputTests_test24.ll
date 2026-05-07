; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

@"x" = internal global i32 100
define i32 @"innerFunction"()
{
entry:
  %"y" = alloca i32
  ;  Source: x
  %"x" = load i32, i32* @"x"
  ;  Source: x/4
  %".4" = sdiv i32 %"x", 4
  ;  Source: inty=x/4;
  store i32 %".4", i32* %"y"
  ;  Source: intx=25;
  store i32 25, i32* @"x"
  %".9" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: y
  %"y.1" = load i32, i32* %"y"
  ;  Source: printf("%d\n",y);
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %"y.1")
  %".13" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* @"x"
  ;  Source: printf("%d\n",x);
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %"x.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"
@"str.1" = internal constant [4 x i8] c"%d\0a\00"
define i8 @"outerFunction"()
{
entry:
  %"y" = alloca i32
  ;  Source: x
  %"x" = load i32, i32* @"x"
  ;  Source: x/2
  %".4" = sdiv i32 %"x", 2
  ;  Source: inty=x/2;
  store i32 %".4", i32* %"y"
  ;  Source: intx=50;
  store i32 50, i32* @"x"
  %".9" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: y
  %"y.1" = load i32, i32* %"y"
  ;  Source: printf("%d\n",y);
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %"y.1")
  %".13" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* @"x"
  ;  Source: printf("%d\n",x);
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %"x.1")
  ;  Source: innerFunction();
  %".18" = call i32 @"innerFunction"()
  ;  Source: return0;
  %".20" = trunc i32 0 to i8
  ret i8 %".20"
}

@"str.2" = internal constant [4 x i8] c"%d\0a\00"
@"str.3" = internal constant [4 x i8] c"%d\0a\00"
define i32 @"main"()
{
entry:
  %".2" = bitcast [4 x i8]* @"str.4" to i8*
  ;  Source: x
  %"x" = load i32, i32* @"x"
  ;  Source: printf("%d\n",x);
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 %"x")
  ;  Source: outerFunction();
  %".7" = call i8 @"outerFunction"()
  %".8" = bitcast [4 x i8]* @"str.5" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* @"x"
  ;  Source: printf("%d\n",x);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"x.1")
  ;  Source: return0;
  ret i32 0
}

@"str.4" = internal constant [4 x i8] c"%d\0a\00"
@"str.5" = internal constant [4 x i8] c"%d\0a\00"