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
  %"k" = alloca [2 x i32]
  %".2" = getelementptr [2 x i32], [2 x i32]* %"k", i32 0, i32 0
  store i32 1, i32* %".2"
  %".4" = getelementptr [2 x i32], [2 x i32]* %"k", i32 0, i32 1
  store i32 2, i32* %".4"
  %"s" = alloca [2 x i32]
  %".6" = getelementptr [2 x i32], [2 x i32]* %"s", i32 0, i32 0
  store i32 3, i32* %".6"
  %".8" = getelementptr [2 x i32], [2 x i32]* %"s", i32 0, i32 1
  store i32 4, i32* %".8"
  %"a" = alloca i32
  %"gep_array" = getelementptr [2 x i32], [2 x i32]* %"s", i32 0, i32 2
  %"array_element" = load i32, i32* %"gep_array"
  %"gep_array.1" = getelementptr [2 x i32], [2 x i32]* %"k", i32 0, i32 2
  %"array_element.1" = load i32, i32* %"gep_array.1"
  %".10" = add i32 %"array_element", %"array_element.1"
  store i32 %".10", i32* %"a"
  ;  User Comment: //int* a = s + k;
  ;  Source: return0;
  ret i32 0
}
