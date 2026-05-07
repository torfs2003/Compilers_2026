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
  %"a" = alloca [3 x i32]
  ;  Source: inta[3];
  ;  Source: a
  ;  Source: a[0]
  %"decay_left" = getelementptr [3 x i32], [3 x i32]* %"a", i32 0, i32 0
  %"gep_idx" = getelementptr i32, i32* %"decay_left", i32 0
  %"array_element" = load i32, i32* %"gep_idx"
  ;  Source: a[0]=10;
  store i32 10, i32* %"gep_idx"
  ;  Source: a
  ;  Source: a[1]
  %"decay_left.1" = getelementptr [3 x i32], [3 x i32]* %"a", i32 0, i32 0
  %"gep_idx.1" = getelementptr i32, i32* %"decay_left.1", i32 1
  %"array_element.1" = load i32, i32* %"gep_idx.1"
  ;  Source: a[1]=20;
  store i32 20, i32* %"gep_idx.1"
  ;  Source: a
  ;  Source: a[2]
  %"decay_left.2" = getelementptr [3 x i32], [3 x i32]* %"a", i32 0, i32 0
  %"gep_idx.2" = getelementptr i32, i32* %"decay_left.2", i32 2
  %"array_element.2" = load i32, i32* %"gep_idx.2"
  ;  Source: a[2]=30;
  store i32 30, i32* %"gep_idx.2"
  %".15" = bitcast [11 x i8]* @"str" to i8*
  ;  Source: a
  ;  Source: a[0]
  %"decay_left.3" = getelementptr [3 x i32], [3 x i32]* %"a", i32 0, i32 0
  %"gep_idx.3" = getelementptr i32, i32* %"decay_left.3", i32 0
  %"array_element.3" = load i32, i32* %"gep_idx.3"
  ;  Source: a
  ;  Source: a[1]
  %"decay_left.4" = getelementptr [3 x i32], [3 x i32]* %"a", i32 0, i32 0
  %"gep_idx.4" = getelementptr i32, i32* %"decay_left.4", i32 1
  %"array_element.4" = load i32, i32* %"gep_idx.4"
  ;  Source: a
  ;  Source: a[2]
  %"decay_left.5" = getelementptr [3 x i32], [3 x i32]* %"a", i32 0, i32 0
  %"gep_idx.5" = getelementptr i32, i32* %"decay_left.5", i32 2
  %"array_element.5" = load i32, i32* %"gep_idx.5"
  ;  Source: printf("%d; %d; %d",a[0],a[1],a[2]);
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %"array_element.3", i32 %"array_element.4", i32 %"array_element.5")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [11 x i8] c"%d; %d; %d\00"