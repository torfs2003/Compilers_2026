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
  %"a" = alloca [2 x [2 x i8]]
  ;  Source: chara[2][2]={{'a','b'},{'c','d'}};
  %".3" = getelementptr [2 x [2 x i8]], [2 x [2 x i8]]* %"a", i32 0, i32 0, i32 0
  store i8 97, i8* %".3"
  %".5" = getelementptr [2 x [2 x i8]], [2 x [2 x i8]]* %"a", i32 0, i32 0, i32 1
  store i8 98, i8* %".5"
  %".7" = getelementptr [2 x [2 x i8]], [2 x [2 x i8]]* %"a", i32 0, i32 1, i32 0
  store i8 99, i8* %".7"
  %".9" = getelementptr [2 x [2 x i8]], [2 x [2 x i8]]* %"a", i32 0, i32 1, i32 1
  store i8 100, i8* %".9"
  %".11" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  ;  Source: a[0]
  %"decay_left" = getelementptr [2 x [2 x i8]], [2 x [2 x i8]]* %"a", i32 0, i32 0
  %"gep_idx" = getelementptr [2 x i8], [2 x i8]* %"decay_left", i32 0
  ;  Source: a[0][0]
  %"decay_left.1" = getelementptr [2 x i8], [2 x i8]* %"gep_idx", i32 0, i32 0
  %"gep_idx.1" = getelementptr i8, i8* %"decay_left.1", i32 0
  %"array_element" = load i8, i8* %"gep_idx.1"
  ;  Source: printf("%c",a[0][0]);
  %".16" = zext i8 %"array_element" to i32
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %".16")
  %".18" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: a
  ;  Source: a[0]
  %"decay_left.2" = getelementptr [2 x [2 x i8]], [2 x [2 x i8]]* %"a", i32 0, i32 0
  %"gep_idx.2" = getelementptr [2 x i8], [2 x i8]* %"decay_left.2", i32 0
  ;  Source: a[0][1]
  %"decay_left.3" = getelementptr [2 x i8], [2 x i8]* %"gep_idx.2", i32 0, i32 0
  %"gep_idx.3" = getelementptr i8, i8* %"decay_left.3", i32 1
  %"array_element.1" = load i8, i8* %"gep_idx.3"
  ;  Source: printf("%c",a[0][1]);
  %".23" = zext i8 %"array_element.1" to i32
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %".23")
  %".25" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: a
  ;  Source: a[1]
  %"decay_left.4" = getelementptr [2 x [2 x i8]], [2 x [2 x i8]]* %"a", i32 0, i32 0
  %"gep_idx.4" = getelementptr [2 x i8], [2 x i8]* %"decay_left.4", i32 1
  ;  Source: a[1][0]
  %"decay_left.5" = getelementptr [2 x i8], [2 x i8]* %"gep_idx.4", i32 0, i32 0
  %"gep_idx.5" = getelementptr i8, i8* %"decay_left.5", i32 0
  %"array_element.2" = load i8, i8* %"gep_idx.5"
  ;  Source: printf("%c",a[1][0]);
  %".30" = zext i8 %"array_element.2" to i32
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 %".30")
  %".32" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: a
  ;  Source: a[1]
  %"decay_left.6" = getelementptr [2 x [2 x i8]], [2 x [2 x i8]]* %"a", i32 0, i32 0
  %"gep_idx.6" = getelementptr [2 x i8], [2 x i8]* %"decay_left.6", i32 1
  ;  Source: a[1][1]
  %"decay_left.7" = getelementptr [2 x i8], [2 x i8]* %"gep_idx.6", i32 0, i32 0
  %"gep_idx.7" = getelementptr i8, i8* %"decay_left.7", i32 1
  %"array_element.3" = load i8, i8* %"gep_idx.7"
  ;  Source: printf("%c",a[1][1]);
  %".37" = zext i8 %"array_element.3" to i32
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 %".37")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%c\00"
@"str.2" = internal constant [3 x i8] c"%c\00"
@"str.3" = internal constant [3 x i8] c"%c\00"