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

declare void @"free"(i8* %".1")

define void @"swap"(i32* %".1", i32* %".2")
{
entry:
  %"a" = alloca i32*
  store i32* %".1", i32** %"a"
  %"b" = alloca i32*
  store i32* %".2", i32** %"b"
  %"temp" = alloca i32
  ;  Source: a
  %"a.1" = load i32*, i32** %"a"
  ;  Source: *a
  %"deref_load" = load i32, i32* %"a.1"
  ;  Source: inttemp=*a;
  store i32 %"deref_load", i32* %"temp"
  ;  Source: a
  %"a.2" = load i32*, i32** %"a"
  %"deref_load.1" = load i32, i32* %"a.2"
  ;  Source: b
  %"b.1" = load i32*, i32** %"b"
  ;  Source: *b
  %"deref_load.2" = load i32, i32* %"b.1"
  ;  Source: *a=*b;
  store i32 %"deref_load.2", i32* %"a.2"
  ;  Source: b
  %"b.2" = load i32*, i32** %"b"
  %"deref_load.3" = load i32, i32* %"b.2"
  ;  Source: temp
  %"temp.1" = load i32, i32* %"temp"
  ;  Source: *b=temp;
  store i32 %"temp.1", i32* %"b.2"
  ret void
}

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx=10;
  store i32 10, i32* %"x"
  %"y" = alloca i32
  ;  Source: inty=20;
  store i32 20, i32* %"y"
  %".6" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: printf("%d\n",x);
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %"x.1")
  %".10" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: y
  %"y.1" = load i32, i32* %"y"
  ;  Source: printf("%d\n",y);
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %"y.1")
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: y
  %"y.2" = load i32, i32* %"y"
  ;  Source: &y
  ;  Source: swap(&x,&y);
  call void @"swap"(i32* %"x", i32* %"y")
  %".20" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: printf("%d\n",x);
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %"x.3")
  %".24" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: y
  %"y.3" = load i32, i32* %"y"
  ;  Source: printf("%d\n",y);
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 %"y.3")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"
@"str.1" = internal constant [4 x i8] c"%d\0a\00"
@"str.2" = internal constant [4 x i8] c"%d\0a\00"
@"str.3" = internal constant [4 x i8] c"%d\0a\00"