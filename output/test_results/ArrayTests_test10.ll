; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca [2 x [2 x i8]]
  ;  Source: charx[2][2];
  ;  Source: x
  ;  Source: x[1]
  %"gep_array" = getelementptr [2 x [2 x i8]], [2 x [2 x i8]]* %"x", i32 0, i32 1
  ;  Source: x[1][1]
  %"gep_array.1" = getelementptr [2 x i8], [2 x i8]* %"gep_array", i32 0, i32 1
  %"array_element" = load i8, i8* %"gep_array.1"
  ;  Source: x[1][1]=110;
  %".7" = trunc i32 110 to i8
  store i8 %".7", i8* %"gep_array.1"
  %".9" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  ;  Source: x[1]
  %"gep_array.2" = getelementptr [2 x [2 x i8]], [2 x [2 x i8]]* %"x", i32 0, i32 1
  ;  Source: x[1][1]
  %"gep_array.3" = getelementptr [2 x i8], [2 x i8]* %"gep_array.2", i32 0, i32 1
  %"array_element.1" = load i8, i8* %"gep_array.3"
  ;  Source: printf("%c",x[1][1]);
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".9", i8 %"array_element.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"