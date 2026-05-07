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
  %".5" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: c
  ;  Source: c[0]
  %"decay_left" = getelementptr [1 x i32*], [1 x i32*]* %"c", i32 0, i32 0
  %"gep_idx" = getelementptr i32*, i32** %"decay_left", i32 0
  %"array_element" = load i32*, i32** %"gep_idx"
  ;  Source: *c[0]
  %"deref_load" = load i32, i32* %"array_element"
  ;  Source: printf("%d",*c[0]);
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %"deref_load")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"