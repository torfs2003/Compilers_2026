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
  %"x" = alloca [1 x [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]]
  ;  Source: intx[1][1][1][1][1][1][1][1];
  ;  Source: x
  ;  Source: x[0]
  %"decay_left" = getelementptr [1 x [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]]* %"x", i32 0, i32 0
  %"gep_idx" = getelementptr [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]* %"decay_left", i32 0
  ;  Source: x[0][0]
  %"decay_left.1" = getelementptr [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]* %"gep_idx", i32 0, i32 0
  %"gep_idx.1" = getelementptr [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]* %"decay_left.1", i32 0
  ;  Source: x[0][0][0]
  %"decay_left.2" = getelementptr [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]* %"gep_idx.1", i32 0, i32 0
  %"gep_idx.2" = getelementptr [1 x [1 x [1 x [1 x [1 x i32]]]]], [1 x [1 x [1 x [1 x [1 x i32]]]]]* %"decay_left.2", i32 0
  ;  Source: x[0][0][0][0]
  %"decay_left.3" = getelementptr [1 x [1 x [1 x [1 x [1 x i32]]]]], [1 x [1 x [1 x [1 x [1 x i32]]]]]* %"gep_idx.2", i32 0, i32 0
  %"gep_idx.3" = getelementptr [1 x [1 x [1 x [1 x i32]]]], [1 x [1 x [1 x [1 x i32]]]]* %"decay_left.3", i32 0
  ;  Source: x[0][0][0][0][0]
  %"decay_left.4" = getelementptr [1 x [1 x [1 x [1 x i32]]]], [1 x [1 x [1 x [1 x i32]]]]* %"gep_idx.3", i32 0, i32 0
  %"gep_idx.4" = getelementptr [1 x [1 x [1 x i32]]], [1 x [1 x [1 x i32]]]* %"decay_left.4", i32 0
  ;  Source: x[0][0][0][0][0][0]
  %"decay_left.5" = getelementptr [1 x [1 x [1 x i32]]], [1 x [1 x [1 x i32]]]* %"gep_idx.4", i32 0, i32 0
  %"gep_idx.5" = getelementptr [1 x [1 x i32]], [1 x [1 x i32]]* %"decay_left.5", i32 0
  ;  Source: x[0][0][0][0][0][0][0]
  %"decay_left.6" = getelementptr [1 x [1 x i32]], [1 x [1 x i32]]* %"gep_idx.5", i32 0, i32 0
  %"gep_idx.6" = getelementptr [1 x i32], [1 x i32]* %"decay_left.6", i32 0
  ;  Source: x[0][0][0][0][0][0][0][0]
  %"decay_left.7" = getelementptr [1 x i32], [1 x i32]* %"gep_idx.6", i32 0, i32 0
  %"gep_idx.7" = getelementptr i32, i32* %"decay_left.7", i32 0
  %"array_element" = load i32, i32* %"gep_idx.7"
  ;  Source: x[0][0][0][0][0][0][0][0]=0;
  store i32 0, i32* %"gep_idx.7"
  %".14" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  ;  Source: x[0]
  %"decay_left.8" = getelementptr [1 x [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]]* %"x", i32 0, i32 0
  %"gep_idx.8" = getelementptr [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]* %"decay_left.8", i32 0
  ;  Source: x[0][0]
  %"decay_left.9" = getelementptr [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]* %"gep_idx.8", i32 0, i32 0
  %"gep_idx.9" = getelementptr [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]* %"decay_left.9", i32 0
  ;  Source: x[0][0][0]
  %"decay_left.10" = getelementptr [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]* %"gep_idx.9", i32 0, i32 0
  %"gep_idx.10" = getelementptr [1 x [1 x [1 x [1 x [1 x i32]]]]], [1 x [1 x [1 x [1 x [1 x i32]]]]]* %"decay_left.10", i32 0
  ;  Source: x[0][0][0][0]
  %"decay_left.11" = getelementptr [1 x [1 x [1 x [1 x [1 x i32]]]]], [1 x [1 x [1 x [1 x [1 x i32]]]]]* %"gep_idx.10", i32 0, i32 0
  %"gep_idx.11" = getelementptr [1 x [1 x [1 x [1 x i32]]]], [1 x [1 x [1 x [1 x i32]]]]* %"decay_left.11", i32 0
  ;  Source: x[0][0][0][0][0]
  %"decay_left.12" = getelementptr [1 x [1 x [1 x [1 x i32]]]], [1 x [1 x [1 x [1 x i32]]]]* %"gep_idx.11", i32 0, i32 0
  %"gep_idx.12" = getelementptr [1 x [1 x [1 x i32]]], [1 x [1 x [1 x i32]]]* %"decay_left.12", i32 0
  ;  Source: x[0][0][0][0][0][0]
  %"decay_left.13" = getelementptr [1 x [1 x [1 x i32]]], [1 x [1 x [1 x i32]]]* %"gep_idx.12", i32 0, i32 0
  %"gep_idx.13" = getelementptr [1 x [1 x i32]], [1 x [1 x i32]]* %"decay_left.13", i32 0
  ;  Source: x[0][0][0][0][0][0][0]
  %"decay_left.14" = getelementptr [1 x [1 x i32]], [1 x [1 x i32]]* %"gep_idx.13", i32 0, i32 0
  %"gep_idx.14" = getelementptr [1 x i32], [1 x i32]* %"decay_left.14", i32 0
  ;  Source: x[0][0][0][0][0][0][0][0]
  %"decay_left.15" = getelementptr [1 x i32], [1 x i32]* %"gep_idx.14", i32 0, i32 0
  %"gep_idx.15" = getelementptr i32, i32* %"decay_left.15", i32 0
  %"array_element.1" = load i32, i32* %"gep_idx.15"
  ;  Source: printf("%d",x[0][0][0][0][0][0][0][0]);
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"array_element.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"