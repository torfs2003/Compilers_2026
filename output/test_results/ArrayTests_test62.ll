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
  %"q" = alloca i32
  ;  Source: intq=5;
  store i32 5, i32* %"q"
  %"y" = alloca [10 x i8]
  ;  Source: chary[10];
  ;  Source: y
  ;  Source: y[5]
  %"decay_left" = getelementptr [10 x i8], [10 x i8]* %"y", i32 0, i32 0
  %"gep_idx" = getelementptr i8, i8* %"decay_left", i32 5
  %"array_element" = load i8, i8* %"gep_idx"
  ;  Source: y[5]='a';
  store i8 97, i8* %"gep_idx"
  %".9" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: y
  ;  Source: y[5]
  %"decay_left.1" = getelementptr [10 x i8], [10 x i8]* %"y", i32 0, i32 0
  %"gep_idx.1" = getelementptr i8, i8* %"decay_left.1", i32 5
  %"array_element.1" = load i8, i8* %"gep_idx.1"
  ;  Source: printf("%d",y[5]);
  %".13" = zext i8 %"array_element.1" to i32
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %".13")
  %"x" = alloca [2 x [3 x i32]]
  ;  Source: intx[2][3];
  ;  Source: x
  ;  Source: x[1]
  %"decay_left.2" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 0
  %"gep_idx.2" = getelementptr [3 x i32], [3 x i32]* %"decay_left.2", i32 1
  ;  Source: x[1][2]
  %"decay_left.3" = getelementptr [3 x i32], [3 x i32]* %"gep_idx.2", i32 0, i32 0
  %"gep_idx.3" = getelementptr i32, i32* %"decay_left.3", i32 2
  %"array_element.2" = load i32, i32* %"gep_idx.3"
  ;  Source: x[1][2]=1;
  store i32 1, i32* %"gep_idx.3"
  %".21" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: x
  ;  Source: x[1]
  %"decay_left.4" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* %"x", i32 0, i32 0
  %"gep_idx.4" = getelementptr [3 x i32], [3 x i32]* %"decay_left.4", i32 1
  ;  Source: x[1][2]
  %"decay_left.5" = getelementptr [3 x i32], [3 x i32]* %"gep_idx.4", i32 0, i32 0
  %"gep_idx.5" = getelementptr i32, i32* %"decay_left.5", i32 2
  %"array_element.3" = load i32, i32* %"gep_idx.5"
  ;  Source: printf("%d",x[1][2]);
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %"array_element.3")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"