; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define void @"swap"(i32* %".1", i32* %".2")
{
entry:
  %"a" = alloca i32*
  store i32* %".1", i32** %"a"
  %"b" = alloca i32*
  store i32* %".2", i32** %"b"
  %"temp" = alloca i32
  %"a_load" = load i32*, i32** %"a"
  %"deref_load" = load i32, i32* %"a_load"
  store i32 %"deref_load", i32* %"temp"
  ;  Source: a
  %"a_load.1" = load i32*, i32** %"a"
  %"deref_load.1" = load i32, i32* %"a_load.1"
  ;  Source: b
  %"b_load" = load i32*, i32** %"b"
  ;  Source: *b
  %"deref_load.2" = load i32, i32* %"b_load"
  ;  Source: *a=*b;
  store i32 %"deref_load.2", i32* %"a_load.1"
  ;  Source: b
  %"b_load.1" = load i32*, i32** %"b"
  %"deref_load.3" = load i32, i32* %"b_load.1"
  ;  Source: temp
  %"temp_load" = load i32, i32* %"temp"
  ;  Source: *b=temp;
  store i32 %"temp_load", i32* %"b_load.1"
  ret void
}

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 10, i32* %"x"
  %"y" = alloca i32
  store i32 20, i32* %"y"
  %".4" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: x
  %"x_load" = load i32, i32* %"x"
  ;  Source: printf("%d\n",x);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"x_load")
  %".8" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: y
  %"y_load" = load i32, i32* %"y"
  ;  Source: printf("%d\n",y);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"y_load")
  ;  Source: x
  %"x_load.1" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: y
  %"y_load.1" = load i32, i32* %"y"
  ;  Source: &y
  ;  Source: swap(&x,&y);
  call void @"swap"(i32* %"x", i32* %"y")
  %".18" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: x
  %"x_load.2" = load i32, i32* %"x"
  ;  Source: printf("%d\n",x);
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %"x_load.2")
  %".22" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: y
  %"y_load.2" = load i32, i32* %"y"
  ;  Source: printf("%d\n",y);
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %"y_load.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"
@"str.1" = internal constant [4 x i8] c"%d\0a\00"
@"str.2" = internal constant [4 x i8] c"%d\0a\00"
@"str.3" = internal constant [4 x i8] c"%d\0a\00"