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

@"a" = internal global [2 x [3 x i32]] zeroinitializer
define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx=3;
  store i32 3, i32* %"x"
  ;  Source: a
  ;  Source: a[0]
  %"decay_left" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* @"a", i32 0, i32 0
  %"gep_idx" = getelementptr [3 x i32], [3 x i32]* %"decay_left", i32 0
  ;  Source: a[0][0]
  %"decay_left.1" = getelementptr [3 x i32], [3 x i32]* %"gep_idx", i32 0, i32 0
  %"gep_idx.1" = getelementptr i32, i32* %"decay_left.1", i32 0
  %"array_element" = load i32, i32* %"gep_idx.1"
  ;  Source: a[0][0]=1;
  store i32 1, i32* %"gep_idx.1"
  ;  Source: a
  ;  Source: a[1]
  %"decay_left.2" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* @"a", i32 0, i32 0
  %"gep_idx.2" = getelementptr [3 x i32], [3 x i32]* %"decay_left.2", i32 1
  ;  Source: a[1][0]
  %"decay_left.3" = getelementptr [3 x i32], [3 x i32]* %"gep_idx.2", i32 0, i32 0
  %"gep_idx.3" = getelementptr i32, i32* %"decay_left.3", i32 0
  %"array_element.1" = load i32, i32* %"gep_idx.3"
  ;  Source: a[1][0]=2;
  store i32 2, i32* %"gep_idx.3"
  %".14" = bitcast [12 x i8]* @"str" to i8*
  ;  Source: a
  ;  Source: a[0]
  %"decay_left.4" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* @"a", i32 0, i32 0
  %"gep_idx.4" = getelementptr [3 x i32], [3 x i32]* %"decay_left.4", i32 0
  ;  Source: a[0][0]
  %"decay_left.5" = getelementptr [3 x i32], [3 x i32]* %"gep_idx.4", i32 0, i32 0
  %"gep_idx.5" = getelementptr i32, i32* %"decay_left.5", i32 0
  %"array_element.2" = load i32, i32* %"gep_idx.5"
  ;  Source: a
  ;  Source: a[1]
  %"decay_left.6" = getelementptr [2 x [3 x i32]], [2 x [3 x i32]]* @"a", i32 0, i32 0
  %"gep_idx.6" = getelementptr [3 x i32], [3 x i32]* %"decay_left.6", i32 1
  ;  Source: a[1][0]
  %"decay_left.7" = getelementptr [3 x i32], [3 x i32]* %"gep_idx.6", i32 0, i32 0
  %"gep_idx.7" = getelementptr i32, i32* %"decay_left.7", i32 0
  %"array_element.3" = load i32, i32* %"gep_idx.7"
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: printf("%d; %d; %d;",a[0][0],a[1][0],x);
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"array_element.2", i32 %"array_element.3", i32 %"x.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [12 x i8] c"%d; %d; %d;\00"