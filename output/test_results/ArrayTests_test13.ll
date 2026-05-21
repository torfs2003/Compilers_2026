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
  %"x" = alloca [2 x i32]
  ;  Source: intx[2.2];
  ;  Source: x
  ;  Source: x[1]
  %"gep_array" = getelementptr [2 x i32], [2 x i32]* %"x", i32 0, i32 1
  %"array_element" = load i32, i32* %"gep_array"
  ;  Source: x[1]=1;
  store i32 1, i32* %"gep_array"
  %".7" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  ;  Source: x[1]
  %"gep_array.1" = getelementptr [2 x i32], [2 x i32]* %"x", i32 0, i32 1
  %"array_element.1" = load i32, i32* %"gep_array.1"
  ;  Source: printf("%d",x[1]);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %"array_element.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"