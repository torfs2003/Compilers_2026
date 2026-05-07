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

define i32 @"main"()
{
entry:
  %"z" = alloca [1 x i32]
  ;  Source: intz[1]={5};
  %".3" = getelementptr [1 x i32], [1 x i32]* %"z", i32 0, i32 0
  store i32 5, i32* %".3"
  %"s" = alloca i32*
  ;  Source: z
  ;  Source: int*s=z;
  %".7" = bitcast [1 x i32]* %"z" to i32*
  store i32* %".7", i32** %"s"
  %"t" = alloca i32**
  ;  Source: s
  %"s.1" = load i32*, i32** %"s"
  ;  Source: &s
  ;  Source: int**t=&s;
  store i32** %"s", i32*** %"t"
  %"b" = alloca i32*
  ;  Source: t
  %"t.1" = load i32**, i32*** %"t"
  ;  Source: *t
  %"deref_load" = load i32*, i32** %"t.1"
  ;  Source: int*b=*t;
  store i32* %"deref_load", i32** %"b"
  %".17" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: b
  %"b.1" = load i32*, i32** %"b"
  ;  Source: b[0]
  %"gep_idx" = getelementptr i32, i32* %"b.1", i32 0
  %"array_element" = load i32, i32* %"gep_idx"
  ;  Source: printf("%d",b[0]);
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".17", i32 %"array_element")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"