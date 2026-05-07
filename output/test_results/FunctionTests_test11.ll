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

define i32 @"func"(i32 %".1", i32 %".2")
{
entry:
  %"a" = alloca i32
  store i32 %".1", i32* %"a"
  %"b" = alloca i32
  store i32 %".2", i32* %"b"
  ;  Source: returna+b;
  %"a.1" = load i32, i32* %"a"
  %"b.1" = load i32, i32* %"b"
  %".7" = add i32 %"a.1", %"b.1"
  ret i32 %".7"
}

define i32 @"main"()
{
entry:
  %"y" = alloca i32
  ;  Source: inty=5;
  store i32 5, i32* %"y"
  %"u" = alloca i32
  ;  Source: intu=10;
  store i32 10, i32* %"u"
  %"c" = alloca i32
  ;  Source: intc;
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  ;  Source: y
  %"y.1" = load i32, i32* %"y"
  ;  Source: u
  %"u.1" = load i32, i32* %"u"
  ;  Source: func(y,u)
  %".11" = call i32 @"func"(i32 %"y.1", i32 %"u.1")
  ;  Source: c=func(y,u);
  store i32 %".11", i32* %"c"
  %".14" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: c
  %"c.2" = load i32, i32* %"c"
  ;  Source: printf("%d\n",c);
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"c.2")
  ;  Source: returny;
  %"y.2" = load i32, i32* %"y"
  ret i32 %"y.2"
}

@"str" = internal constant [4 x i8] c"%d\0a\00"