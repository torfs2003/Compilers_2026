; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define float @"mul"(i32** %".1")
{
entry:
  %"b" = alloca i32**
  store i32** %".1", i32*** %"b"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: b
  %"b_load" = load i32**, i32*** %"b"
  ;  Source: (*b)
  %"deref_load" = load i32*, i32** %"b_load"
  ;  Source: (*b)[0]
  %"gep_ptr" = getelementptr i32, i32* %"deref_load", i32 0
  %"array_element" = load i32, i32* %"gep_ptr"
  ;  Source: printf("%d",(*b)[0]);
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"array_element")
  ;  Source: return0.0;
  ret float              0x0
}

define i32 @"main"()
{
entry:
  %"z" = alloca [5 x i32]
  store [5 x i32] zeroinitializer, [5 x i32]* %"z"
  %".3" = getelementptr [5 x i32], [5 x i32]* %"z", i32 0, i32 0
  store i32 1, i32* %".3"
  %".5" = getelementptr [5 x i32], [5 x i32]* %"z", i32 0, i32 1
  store i32 2, i32* %".5"
  %".7" = getelementptr [5 x i32], [5 x i32]* %"z", i32 0, i32 2
  store i32 3, i32* %".7"
  %".9" = getelementptr [5 x i32], [5 x i32]* %"z", i32 0, i32 3
  store i32 4, i32* %".9"
  %".11" = getelementptr [5 x i32], [5 x i32]* %"z", i32 0, i32 4
  store i32 5, i32* %".11"
  %"a" = alloca i32*
  %".13" = bitcast [5 x i32]* %"z" to i32*
  store i32* %".13", i32** %"a"
  %"b" = alloca i32**
  store i32** %"a", i32*** %"b"
  ;  Source: b
  %"b_load" = load i32**, i32*** %"b"
  ;  Source: mul(b);
  %".18" = call float @"mul"(i32** %"b_load")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"