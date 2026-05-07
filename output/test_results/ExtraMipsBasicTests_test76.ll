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
  %"a" = alloca [2 x i8]
  ;  Source: chara[2]={'a','b'};
  %".3" = getelementptr [2 x i8], [2 x i8]* %"a", i32 0, i32 0
  store i8 97, i8* %".3"
  %".5" = getelementptr [2 x i8], [2 x i8]* %"a", i32 0, i32 1
  store i8 98, i8* %".5"
  %".7" = bitcast [5 x i8]* @"str" to i8*
  ;  Source: a
  ;  Source: a[0]
  %"decay_left" = getelementptr [2 x i8], [2 x i8]* %"a", i32 0, i32 0
  %"gep_idx" = getelementptr i8, i8* %"decay_left", i32 0
  %"array_element" = load i8, i8* %"gep_idx"
  ;  Source: a
  ;  Source: a[1]
  %"decay_left.1" = getelementptr [2 x i8], [2 x i8]* %"a", i32 0, i32 0
  %"gep_idx.1" = getelementptr i8, i8* %"decay_left.1", i32 1
  %"array_element.1" = load i8, i8* %"gep_idx.1"
  ;  Source: printf("%c%c",a[0],a[1]);
  %".13" = zext i8 %"array_element" to i32
  %".14" = zext i8 %"array_element.1" to i32
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %".13", i32 %".14")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [5 x i8] c"%c%c\00"