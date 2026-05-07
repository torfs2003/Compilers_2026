; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define float @"mul"(i32** %".1")
{
entry:
  %"b" = alloca i32**
  store i32** %".1", i32*** %"b"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: b
  %"b.1" = load i32**, i32*** %"b"
  ;  Source: b[0]
  %"gep_ptr" = getelementptr i32*, i32** %"b.1", i32 0
  %"array_element" = load i32*, i32** %"gep_ptr"
  ;  Source: printf("%d",b[0]);
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".4", i32* %"array_element")
  ;  User Comment: /* This isn't always possible when an int* is given instead of int** */
  ;  Source: return0.0;
  ret float              0x0
}

@"str" = internal constant [3 x i8] c"%d\00"
define i32 @"main"()
{
entry:
  %"z" = alloca [5 x i32]
  ;  Source: intz[5]={1,2,3,4,5};
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
  %"a" = alloca i32**
  ;  Source: z
  ;  Source: &z
  ;  Source: int**a=&z;
  %".16" = bitcast [5 x i32]* %"z" to i32**
  store i32** %".16", i32*** %"a"
  ;  Source: a
  %"a.1" = load i32**, i32*** %"a"
  ;  Source: mul(a);
  %".20" = call float @"mul"(i32** %"a.1")
  ;  Source: return0;
  ret i32 0
}
