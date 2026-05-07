; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"a" = alloca [2 x i32]
  ;  Source: inta[]={2,3};
  %".3" = getelementptr [2 x i32], [2 x i32]* %"a", i32 0, i32 0
  store i32 2, i32* %".3"
  %".5" = getelementptr [2 x i32], [2 x i32]* %"a", i32 0, i32 1
  store i32 3, i32* %".5"
  %".7" = bitcast [6 x i8]* @"str" to i8*
  ;  Source: a
  ;  Source: a[0]
  %"decay_left" = getelementptr [2 x i32], [2 x i32]* %"a", i32 0, i32 0
  %"gep_ptr" = getelementptr i32, i32* %"decay_left", i32 0
  %"array_element" = load i32, i32* %"gep_ptr"
  ;  Source: a
  ;  Source: a[1]
  %"decay_left.1" = getelementptr [2 x i32], [2 x i32]* %"a", i32 0, i32 0
  %"gep_ptr.1" = getelementptr i32, i32* %"decay_left.1", i32 1
  %"array_element.1" = load i32, i32* %"gep_ptr.1"
  ;  Source: printf("%d %d",a[0],a[1]);
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %"array_element", i32 %"array_element.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [6 x i8] c"%d %d\00"