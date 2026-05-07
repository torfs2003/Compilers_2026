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
  %"c" = alloca [5 x i32]
  %".2" = getelementptr [5 x i32], [5 x i32]* %"c", i32 0, i32 0
  store i32 1, i32* %".2"
  %".4" = getelementptr [5 x i32], [5 x i32]* %"c", i32 0, i32 1
  store i32 2, i32* %".4"
  %".6" = getelementptr [5 x i32], [5 x i32]* %"c", i32 0, i32 2
  store i32 3, i32* %".6"
  %".8" = getelementptr [5 x i32], [5 x i32]* %"c", i32 0, i32 3
  store i32 4, i32* %".8"
  %".10" = getelementptr [5 x i32], [5 x i32]* %"c", i32 0, i32 4
  store i32 5, i32* %".10"
  ;  Source: c
  ;  Source: c[1]
  %"gep_array" = getelementptr [5 x i32], [5 x i32]* %"c", i32 0, i32 1
  %"array_element" = load i32, i32* %"gep_array"
  ;  Source: c[1]=0;
  store i32 0, i32* %"gep_array"
  %".16" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: c
  ;  Source: c[0]
  %"gep_array.1" = getelementptr [5 x i32], [5 x i32]* %"c", i32 0, i32 0
  %"array_element.1" = load i32, i32* %"gep_array.1"
  ;  Source: printf("%d",c[0]);
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 %"array_element.1")
  %".21" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: c
  ;  Source: c[1]
  %"gep_array.2" = getelementptr [5 x i32], [5 x i32]* %"c", i32 0, i32 1
  %"array_element.2" = load i32, i32* %"gep_array.2"
  ;  Source: printf("%d",c[1]);
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %"array_element.2")
  %".26" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: c
  ;  Source: c[2]
  %"gep_array.3" = getelementptr [5 x i32], [5 x i32]* %"c", i32 0, i32 2
  %"array_element.3" = load i32, i32* %"gep_array.3"
  ;  Source: printf("%d",c[2]);
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 %"array_element.3")
  %".31" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: c
  ;  Source: c[3]
  %"gep_array.4" = getelementptr [5 x i32], [5 x i32]* %"c", i32 0, i32 3
  %"array_element.4" = load i32, i32* %"gep_array.4"
  ;  Source: printf("%d",c[3]);
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".31", i32 %"array_element.4")
  %".36" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: c
  ;  Source: c[4]
  %"gep_array.5" = getelementptr [5 x i32], [5 x i32]* %"c", i32 0, i32 4
  %"array_element.5" = load i32, i32* %"gep_array.5"
  ;  Source: printf("%d",c[4]);
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %"array_element.5")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"