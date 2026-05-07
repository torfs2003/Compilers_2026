; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"main"()
{
entry:
  %"x" = alloca [2 x [2 x i32]]
  %".2" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"x", i32 0, i32 0, i32 0
  store i32 1, i32* %".2"
  %".4" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"x", i32 0, i32 0, i32 1
  store i32 2, i32* %".4"
  %".6" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"x", i32 0, i32 1, i32 0
  store i32 3, i32* %".6"
  %".8" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"x", i32 0, i32 1, i32 1
  store i32 4, i32* %".8"
  %".10" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"x", i32 0, i32 1, i32 2
  store i32 5, i32* %".10"
  %".12" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  ;  Source: x[0]
  %"gep_array" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"x", i32 0, i32 0
  ;  Source: x[0][0]
  %"gep_array.1" = getelementptr [2 x i32], [2 x i32]* %"gep_array", i32 0, i32 0
  %"array_element" = load i32, i32* %"gep_array.1"
  ;  Source: printf("%d",x[0][0]);
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"array_element")
  %".18" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: x
  ;  Source: x[0]
  %"gep_array.2" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"x", i32 0, i32 0
  ;  Source: x[0][1]
  %"gep_array.3" = getelementptr [2 x i32], [2 x i32]* %"gep_array.2", i32 0, i32 1
  %"array_element.1" = load i32, i32* %"gep_array.3"
  ;  Source: printf("%d",x[0][1]);
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %"array_element.1")
  %".24" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: x
  ;  Source: x[1]
  %"gep_array.4" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"x", i32 0, i32 1
  ;  Source: x[1][0]
  %"gep_array.5" = getelementptr [2 x i32], [2 x i32]* %"gep_array.4", i32 0, i32 0
  %"array_element.2" = load i32, i32* %"gep_array.5"
  ;  Source: printf("%d",x[1][0]);
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 %"array_element.2")
  %".30" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: x
  ;  Source: x[1]
  %"gep_array.6" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"x", i32 0, i32 1
  ;  Source: x[1][1]
  %"gep_array.7" = getelementptr [2 x i32], [2 x i32]* %"gep_array.6", i32 0, i32 1
  %"array_element.3" = load i32, i32* %"gep_array.7"
  ;  Source: printf("%d",x[1][1]);
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 %"array_element.3")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"