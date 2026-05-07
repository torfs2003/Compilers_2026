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
  %"x" = alloca [2 x [2 x i8]]
  ;  Source: charx[2][2];
  ;  Source: x
  ;  Source: x[1]
  %"decay_left" = getelementptr [2 x [2 x i8]], [2 x [2 x i8]]* %"x", i32 0, i32 0
  %"gep_idx" = getelementptr [2 x i8], [2 x i8]* %"decay_left", i32 1
  ;  Source: x[1][1]
  %"decay_left.1" = getelementptr [2 x i8], [2 x i8]* %"gep_idx", i32 0, i32 0
  %"gep_idx.1" = getelementptr i8, i8* %"decay_left.1", i32 1
  %"array_element" = load i8, i8* %"gep_idx.1"
  ;  Source: x[1][1]=110;
  %".7" = trunc i32 110 to i8
  store i8 %".7", i8* %"gep_idx.1"
  %".9" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  ;  Source: x[1]
  %"decay_left.2" = getelementptr [2 x [2 x i8]], [2 x [2 x i8]]* %"x", i32 0, i32 0
  %"gep_idx.2" = getelementptr [2 x i8], [2 x i8]* %"decay_left.2", i32 1
  ;  Source: x[1][1]
  %"decay_left.3" = getelementptr [2 x i8], [2 x i8]* %"gep_idx.2", i32 0, i32 0
  %"gep_idx.3" = getelementptr i8, i8* %"decay_left.3", i32 1
  %"array_element.1" = load i8, i8* %"gep_idx.3"
  ;  Source: printf("%c",x[1][1]);
  %".14" = zext i8 %"array_element.1" to i32
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %".14")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"