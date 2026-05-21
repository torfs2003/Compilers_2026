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
  %"array_decay" = getelementptr [2 x [2 x i8]], [2 x [2 x i8]]* %"x", i32 0, i32 0
  %"array_decay.1" = getelementptr [2 x i8], [2 x i8]* %"array_decay", i32 0, i32 0
  %"deref_load" = load i8, i8* %"array_decay.1"
  ;  Source: **x=110;
  %".5" = trunc i32 110 to i8
  store i8 %".5", i8* %"array_decay.1"
  %".7" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  ;  Source: x[0]
  %"decay_left" = getelementptr [2 x [2 x i8]], [2 x [2 x i8]]* %"x", i32 0, i32 0
  %"gep_idx" = getelementptr [2 x i8], [2 x i8]* %"decay_left", i32 0
  ;  Source: x[0][0]
  %"decay_left.1" = getelementptr [2 x i8], [2 x i8]* %"gep_idx", i32 0, i32 0
  %"gep_idx.1" = getelementptr i8, i8* %"decay_left.1", i32 0
  %"array_element" = load i8, i8* %"gep_idx.1"
  ;  Source: printf("%c",x[0][0]);
  %".12" = zext i8 %"array_element" to i32
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %".12")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"