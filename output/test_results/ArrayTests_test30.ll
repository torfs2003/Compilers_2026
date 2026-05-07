; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32** @"mul"(i32** %".1")
{
entry:
  %"b" = alloca i32**
  store i32** %".1", i32*** %"b"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: b
  %"b.1" = load i32**, i32*** %"b"
  ;  Source: (*b)
  %"deref_load" = load i32*, i32** %"b.1"
  ;  Source: (*b)[0]
  %"gep_ptr" = getelementptr i32, i32* %"deref_load", i32 0
  %"array_element" = load i32, i32* %"gep_ptr"
  ;  Source: printf("%d",(*b)[0]);
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"array_element")
  ;  Source: returnb;
  %"b.2" = load i32**, i32*** %"b"
  ret i32** %"b.2"
}

define i32 @"main"()
{
entry:
  %"z" = alloca [5 x i32]
  %".2" = getelementptr [5 x i32], [5 x i32]* %"z", i32 0, i32 0
  store i32 1, i32* %".2"
  %".4" = getelementptr [5 x i32], [5 x i32]* %"z", i32 0, i32 1
  store i32 2, i32* %".4"
  %".6" = getelementptr [5 x i32], [5 x i32]* %"z", i32 0, i32 2
  store i32 3, i32* %".6"
  %".8" = getelementptr [5 x i32], [5 x i32]* %"z", i32 0, i32 3
  store i32 4, i32* %".8"
  %".10" = getelementptr [5 x i32], [5 x i32]* %"z", i32 0, i32 4
  store i32 5, i32* %".10"
  %"a" = alloca i32*
  %".12" = bitcast [5 x i32]* %"z" to i32*
  store i32* %".12", i32** %"a"
  %"b" = alloca i32**
  store i32** %"a", i32*** %"b"
  ;  Source: b
  %"b.1" = load i32**, i32*** %"b"
  ;  Source: b
  %"b.2" = load i32**, i32*** %"b"
  ;  Source: mul(b)
  %".18" = call i32** @"mul"(i32** %"b.2")
  ;  Source: b=mul(b);
  store i32** %".18", i32*** %"b"
  %".21" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: b
  %"b.3" = load i32**, i32*** %"b"
  ;  Source: (*b)
  %"deref_load" = load i32*, i32** %"b.3"
  ;  Source: (*b)[0]
  %"gep_ptr" = getelementptr i32, i32* %"deref_load", i32 0
  %"array_element" = load i32, i32* %"gep_ptr"
  ;  Source: printf("%d",(*b)[0]);
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %"array_element")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"