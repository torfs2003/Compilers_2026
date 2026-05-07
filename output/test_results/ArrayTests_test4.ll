; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"q" = alloca i32
  store i32 5, i32* %"q"
  %"x" = alloca [11 x [20 x i32]]
  ;  Source: x
  ;  Source: x[10]
  %"gep_array" = getelementptr [11 x [20 x i32]], [11 x [20 x i32]]* %"x", i32 0, i32 10
  ;  Source: x[10][19]
  %"gep_array.1" = getelementptr [20 x i32], [20 x i32]* %"gep_array", i32 0, i32 19
  %"array_element" = load i32, i32* %"gep_array.1"
  ;  Source: x[10][19]=1;
  store i32 1, i32* %"gep_array.1"
  %".8" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  ;  Source: x[10]
  %"gep_array.2" = getelementptr [11 x [20 x i32]], [11 x [20 x i32]]* %"x", i32 0, i32 10
  ;  Source: x[10][19]
  %"gep_array.3" = getelementptr [20 x i32], [20 x i32]* %"gep_array.2", i32 0, i32 19
  %"array_element.1" = load i32, i32* %"gep_array.3"
  ;  Source: printf("%d",x[10][19]);
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"array_element.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"