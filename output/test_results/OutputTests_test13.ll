; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 -60, i32* %"x"
  %".3" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  %"x_load" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %"x_load")
  %"some_pointer" = alloca i32*
  store i32* %"x", i32** %"some_pointer"
  %".8" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: x
  %"x_load.1" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"x_load.1")
  %".12" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: some_pointer
  %"some_pointer_load" = load i32*, i32** %"some_pointer"
  ;  Source: *some_pointer
  %"deref_load" = load i32, i32* %"some_pointer_load"
  ;  Source: printf("%d",*some_pointer);
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"deref_load")
  ;  Source: some_pointer
  %"some_pointer_load.1" = load i32*, i32** %"some_pointer"
  %"deref_load.1" = load i32, i32* %"some_pointer_load.1"
  ;  Source: *some_pointer=53;
  store i32 53, i32* %"some_pointer_load.1"
  %".20" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: x
  %"x_load.2" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %"x_load.2")
  %".24" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: some_pointer
  %"some_pointer_load.2" = load i32*, i32** %"some_pointer"
  ;  Source: *some_pointer
  %"deref_load.2" = load i32, i32* %"some_pointer_load.2"
  ;  Source: printf("%d",*some_pointer);
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 %"deref_load.2")
  %"another_pointer" = alloca i32**
  store i32** %"some_pointer", i32*** %"another_pointer"
  %"triple_pointer" = alloca i32***
  store i32*** %"another_pointer", i32**** %"triple_pointer"
  %"y" = alloca i32
  %"triple_pointer_load" = load i32***, i32**** %"triple_pointer"
  %"deref_load.3" = load i32**, i32*** %"triple_pointer_load"
  %"deref_load.4" = load i32*, i32** %"deref_load.3"
  %"deref_load.5" = load i32, i32* %"deref_load.4"
  store i32 %"deref_load.5", i32* %"y"
  %".32" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: another_pointer
  %"another_pointer_load" = load i32**, i32*** %"another_pointer"
  %"deref_load.6" = load i32*, i32** %"another_pointer_load"
  ;  Source: **another_pointer
  %"deref_load.7" = load i32, i32* %"deref_load.6"
  ;  Source: printf("%d",**another_pointer);
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 %"deref_load.7")
  %".37" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: triple_pointer
  %"triple_pointer_load.1" = load i32***, i32**** %"triple_pointer"
  %"deref_load.8" = load i32**, i32*** %"triple_pointer_load.1"
  %"deref_load.9" = load i32*, i32** %"deref_load.8"
  ;  Source: ***triple_pointer
  %"deref_load.10" = load i32, i32* %"deref_load.9"
  ;  Source: printf("%d",***triple_pointer);
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".37", i32 %"deref_load.10")
  %".42" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: y
  %"y_load" = load i32, i32* %"y"
  ;  Source: printf("%d",y);
  %".45" = call i32 (i8*, ...) @"printf"(i8* %".42", i32 %"y_load")
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