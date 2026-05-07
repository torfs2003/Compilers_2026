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
  %"a" = alloca i32
  ;  Source: inta=1;
  store i32 1, i32* %"a"
  %"c" = alloca [1 x i32*]
  ;  Source: int*c[1]={&a};
  %"t" = alloca i32**
  ;  Source: c
  ;  Source: int**t=c;
  %".7" = bitcast [1 x i32*]* %"c" to i32**
  store i32** %".7", i32*** %"t"
  %".9" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: t
  %"t.1" = load i32**, i32*** %"t"
  %"deref_load" = load i32*, i32** %"t.1"
  ;  Source: **t
  %"deref_load.1" = load i32, i32* %"deref_load"
  ;  Source: printf("%d",**t);
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %"deref_load.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"