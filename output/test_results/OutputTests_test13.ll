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

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx=-60;
  store i32 -60, i32* %"x"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"x.1")
  %"some_pointer" = alloca i32*
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: int*some_pointer=&x;
  store i32* %"x", i32** %"some_pointer"
  %".12" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"x.3")
  %".16" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: some_pointer
  %"some_pointer.1" = load i32*, i32** %"some_pointer"
  ;  Source: *some_pointer
  %"deref_load" = load i32, i32* %"some_pointer.1"
  ;  Source: printf("%d",*some_pointer);
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 %"deref_load")
  ;  Source: some_pointer
  %"some_pointer.2" = load i32*, i32** %"some_pointer"
  %"deref_load.1" = load i32, i32* %"some_pointer.2"
  ;  Source: *some_pointer=53;
  store i32 53, i32* %"some_pointer.2"
  %".24" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: x
  %"x.4" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 %"x.4")
  %".28" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: some_pointer
  %"some_pointer.3" = load i32*, i32** %"some_pointer"
  ;  Source: *some_pointer
  %"deref_load.2" = load i32, i32* %"some_pointer.3"
  ;  Source: printf("%d",*some_pointer);
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 %"deref_load.2")
  %"another_pointer" = alloca i32**
  ;  Source: some_pointer
  %"some_pointer.4" = load i32*, i32** %"some_pointer"
  ;  Source: &some_pointer
  ;  Source: int**another_pointer=&some_pointer;
  store i32** %"some_pointer", i32*** %"another_pointer"
  %"triple_pointer" = alloca i32***
  ;  Source: another_pointer
  %"another_pointer.1" = load i32**, i32*** %"another_pointer"
  ;  Source: &another_pointer
  ;  Source: int***triple_pointer=&another_pointer;
  store i32*** %"another_pointer", i32**** %"triple_pointer"
  %"y" = alloca i32
  ;  Source: triple_pointer
  %"triple_pointer.1" = load i32***, i32**** %"triple_pointer"
  %"deref_load.3" = load i32**, i32*** %"triple_pointer.1"
  %"deref_load.4" = load i32*, i32** %"deref_load.3"
  ;  Source: ***triple_pointer
  %"deref_load.5" = load i32, i32* %"deref_load.4"
  ;  Source: inty=***triple_pointer;
  store i32 %"deref_load.5", i32* %"y"
  %".45" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: another_pointer
  %"another_pointer.2" = load i32**, i32*** %"another_pointer"
  %"deref_load.6" = load i32*, i32** %"another_pointer.2"
  ;  Source: **another_pointer
  %"deref_load.7" = load i32, i32* %"deref_load.6"
  ;  Source: printf("%d",**another_pointer);
  %".49" = call i32 (i8*, ...) @"printf"(i8* %".45", i32 %"deref_load.7")
  %".50" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: triple_pointer
  %"triple_pointer.2" = load i32***, i32**** %"triple_pointer"
  %"deref_load.8" = load i32**, i32*** %"triple_pointer.2"
  %"deref_load.9" = load i32*, i32** %"deref_load.8"
  ;  Source: ***triple_pointer
  %"deref_load.10" = load i32, i32* %"deref_load.9"
  ;  Source: printf("%d",***triple_pointer);
  %".54" = call i32 (i8*, ...) @"printf"(i8* %".50", i32 %"deref_load.10")
  %".55" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: y
  %"y.1" = load i32, i32* %"y"
  ;  Source: printf("%d",y);
  %".58" = call i32 (i8*, ...) @"printf"(i8* %".55", i32 %"y.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"
@"str.5" = internal constant [3 x i8] c"%d\00"
@"str.6" = internal constant [3 x i8] c"%d\00"
@"str.7" = internal constant [3 x i8] c"%d\00"