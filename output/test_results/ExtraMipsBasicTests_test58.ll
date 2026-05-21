; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca [1 x [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]]
  ;  Source: x
  ;  Source: x[0]
  %"gep_array" = getelementptr [1 x [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]]* %"x", i32 0, i32 0
  ;  Source: x[0][0]
  %"gep_array.1" = getelementptr [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]* %"gep_array", i32 0, i32 0
  ;  Source: x[0][0][0]
  %"gep_array.2" = getelementptr [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]* %"gep_array.1", i32 0, i32 0
  ;  Source: x[0][0][0][0]
  %"gep_array.3" = getelementptr [1 x [1 x [1 x [1 x [1 x i32]]]]], [1 x [1 x [1 x [1 x [1 x i32]]]]]* %"gep_array.2", i32 0, i32 0
  ;  Source: x[0][0][0][0][0]
  %"gep_array.4" = getelementptr [1 x [1 x [1 x [1 x i32]]]], [1 x [1 x [1 x [1 x i32]]]]* %"gep_array.3", i32 0, i32 0
  ;  Source: x[0][0][0][0][0][0]
  %"gep_array.5" = getelementptr [1 x [1 x [1 x i32]]], [1 x [1 x [1 x i32]]]* %"gep_array.4", i32 0, i32 0
  ;  Source: x[0][0][0][0][0][0][0]
  %"gep_array.6" = getelementptr [1 x [1 x i32]], [1 x [1 x i32]]* %"gep_array.5", i32 0, i32 0
  ;  Source: x[0][0][0][0][0][0][0][0]
  %"gep_array.7" = getelementptr [1 x i32], [1 x i32]* %"gep_array.6", i32 0, i32 0
  %"array_element" = load i32, i32* %"gep_array.7"
  ;  Source: x[0][0][0][0][0][0][0][0]=0;
  store i32 0, i32* %"gep_array.7"
  %".13" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  ;  Source: x[0]
  %"gep_array.8" = getelementptr [1 x [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]]* %"x", i32 0, i32 0
  ;  Source: x[0][0]
  %"gep_array.9" = getelementptr [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]]* %"gep_array.8", i32 0, i32 0
  ;  Source: x[0][0][0]
  %"gep_array.10" = getelementptr [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]], [1 x [1 x [1 x [1 x [1 x [1 x i32]]]]]]* %"gep_array.9", i32 0, i32 0
  ;  Source: x[0][0][0][0]
  %"gep_array.11" = getelementptr [1 x [1 x [1 x [1 x [1 x i32]]]]], [1 x [1 x [1 x [1 x [1 x i32]]]]]* %"gep_array.10", i32 0, i32 0
  ;  Source: x[0][0][0][0][0]
  %"gep_array.12" = getelementptr [1 x [1 x [1 x [1 x i32]]]], [1 x [1 x [1 x [1 x i32]]]]* %"gep_array.11", i32 0, i32 0
  ;  Source: x[0][0][0][0][0][0]
  %"gep_array.13" = getelementptr [1 x [1 x [1 x i32]]], [1 x [1 x [1 x i32]]]* %"gep_array.12", i32 0, i32 0
  ;  Source: x[0][0][0][0][0][0][0]
  %"gep_array.14" = getelementptr [1 x [1 x i32]], [1 x [1 x i32]]* %"gep_array.13", i32 0, i32 0
  ;  Source: x[0][0][0][0][0][0][0][0]
  %"gep_array.15" = getelementptr [1 x i32], [1 x i32]* %"gep_array.14", i32 0, i32 0
  %"array_element.1" = load i32, i32* %"gep_array.15"
  ;  Source: printf("%d",x[0][0][0][0][0][0][0][0]);
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %"array_element.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"