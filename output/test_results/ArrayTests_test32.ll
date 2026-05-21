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
  %"x" = alloca i32
  store i32 3, i32* %"x"
  ;  Source: a
  ;  Source: a[0]
  %"gep_array" = getelementptr [2 x i32], [2 x i32]* @"a", i32 0, i32 0
  %"array_element" = load i32, i32* %"gep_array"
  ;  Source: a[0]=1;
  store i32 1, i32* %"gep_array"
  ;  Source: a
  ;  Source: a[1]
  %"gep_array.1" = getelementptr [2 x i32], [2 x i32]* @"a", i32 0, i32 1
  %"array_element.1" = load i32, i32* %"gep_array.1"
  ;  Source: a[1]=2;
  store i32 2, i32* %"gep_array.1"
  %".11" = bitcast [12 x i8]* @"str" to i8*
  ;  Source: a
  ;  Source: a[0]
  %"gep_array.2" = getelementptr [2 x i32], [2 x i32]* @"a", i32 0, i32 0
  %"array_element.2" = load i32, i32* %"gep_array.2"
  ;  Source: a
  ;  Source: a[1]
  %"gep_array.3" = getelementptr [2 x i32], [2 x i32]* @"a", i32 0, i32 1
  %"array_element.3" = load i32, i32* %"gep_array.3"
  ;  Source: x
  %"x_load" = load i32, i32* %"x"
  ;  Source: printf("%d; %d; %d;",a[0],a[1],x);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %"array_element.2", i32 %"array_element.3", i32 %"x_load")
  ;  Source: return0;
  ret i32 0
}

@"a" = internal global [2 x i32] zeroinitializer
@"str" = internal constant [12 x i8] c"%d; %d; %d;\00"