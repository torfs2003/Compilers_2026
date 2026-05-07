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
  %"x" = alloca [2 x [2 x i32]]
  ;  Source: intx[2][2]={{1,2},{3,4,5}};
  %".3" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"x", i32 0, i32 0, i32 0
  store i32 1, i32* %".3"
  %".5" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"x", i32 0, i32 0, i32 1
  store i32 2, i32* %".5"
  %".7" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"x", i32 0, i32 1, i32 0
  store i32 3, i32* %".7"
  %".9" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"x", i32 0, i32 1, i32 1
  store i32 4, i32* %".9"
  %".11" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  ;  Source: x[0]
  %"decay_left" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"x", i32 0, i32 0
  %"gep_idx" = getelementptr [2 x i32], [2 x i32]* %"decay_left", i32 0
  ;  Source: x[0][0]
  %"decay_left.1" = getelementptr [2 x i32], [2 x i32]* %"gep_idx", i32 0, i32 0
  %"gep_idx.1" = getelementptr i32, i32* %"decay_left.1", i32 0
  %"array_element" = load i32, i32* %"gep_idx.1"
  ;  Source: printf("%d",x[0][0]);
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %"array_element")
  %".17" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: x
  ;  Source: x[0]
  %"decay_left.2" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"x", i32 0, i32 0
  %"gep_idx.2" = getelementptr [2 x i32], [2 x i32]* %"decay_left.2", i32 0
  ;  Source: x[0][1]
  %"decay_left.3" = getelementptr [2 x i32], [2 x i32]* %"gep_idx.2", i32 0, i32 0
  %"gep_idx.3" = getelementptr i32, i32* %"decay_left.3", i32 1
  %"array_element.1" = load i32, i32* %"gep_idx.3"
  ;  Source: printf("%d",x[0][1]);
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".17", i32 %"array_element.1")
  %".23" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: x
  ;  Source: x[1]
  %"decay_left.4" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"x", i32 0, i32 0
  %"gep_idx.4" = getelementptr [2 x i32], [2 x i32]* %"decay_left.4", i32 1
  ;  Source: x[1][0]
  %"decay_left.5" = getelementptr [2 x i32], [2 x i32]* %"gep_idx.4", i32 0, i32 0
  %"gep_idx.5" = getelementptr i32, i32* %"decay_left.5", i32 0
  %"array_element.2" = load i32, i32* %"gep_idx.5"
  ;  Source: printf("%d",x[1][0]);
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %"array_element.2")
  %".29" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: x
  ;  Source: x[1]
  %"decay_left.6" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"x", i32 0, i32 0
  %"gep_idx.6" = getelementptr [2 x i32], [2 x i32]* %"decay_left.6", i32 1
  ;  Source: x[1][1]
  %"decay_left.7" = getelementptr [2 x i32], [2 x i32]* %"gep_idx.6", i32 0, i32 0
  %"gep_idx.7" = getelementptr i32, i32* %"decay_left.7", i32 1
  %"array_element.3" = load i32, i32* %"gep_idx.7"
  ;  Source: printf("%d",x[1][1]);
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".29", i32 %"array_element.3")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"