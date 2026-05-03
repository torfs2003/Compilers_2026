; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca [2 x [2 x i32]]
  ;  Source: intx[2][2]={{1,2},{3,4}};
  %".3" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"x", i32 0, i32 0, i32 0
  store i32 1, i32* %".3"
  %".5" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"x", i32 0, i32 0, i32 1
  store i32 2, i32* %".5"
  %".7" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"x", i32 0, i32 1, i32 0
  store i32 3, i32* %".7"
  %".9" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"x", i32 0, i32 1, i32 1
  store i32 4, i32* %".9"
  %".11" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  ;  Source: x[0]
  %"gep_array" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"x", i32 0, i32 0
  ;  Source: x[0][0]
  %"gep_array.1" = getelementptr [2 x i32], [2 x i32]* %"gep_array", i32 0, i32 0
  %"array_element" = load i32, i32* %"gep_array.1"
  ;  Source: printf("%d",x[0][0]);
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %"array_element")
  %".17" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: x
  ;  Source: x[0]
  %"gep_array.2" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"x", i32 0, i32 0
  ;  Source: x[0][1]
  %"gep_array.3" = getelementptr [2 x i32], [2 x i32]* %"gep_array.2", i32 0, i32 1
  %"array_element.1" = load i32, i32* %"gep_array.3"
  ;  Source: printf("%d",x[0][1]);
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".17", i32 %"array_element.1")
  %".23" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: x
  ;  Source: x[1]
  %"gep_array.4" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"x", i32 0, i32 1
  ;  Source: x[1][0]
  %"gep_array.5" = getelementptr [2 x i32], [2 x i32]* %"gep_array.4", i32 0, i32 0
  %"array_element.2" = load i32, i32* %"gep_array.5"
  ;  Source: printf("%d",x[1][0]);
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %"array_element.2")
  %".29" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: x
  ;  Source: x[1]
  %"gep_array.6" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"x", i32 0, i32 1
  ;  Source: x[1][1]
  %"gep_array.7" = getelementptr [2 x i32], [2 x i32]* %"gep_array.6", i32 0, i32 1
  %"array_element.3" = load i32, i32* %"gep_array.7"
  ;  Source: printf("%d",x[1][1]);
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".29", i32 %"array_element.3")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"