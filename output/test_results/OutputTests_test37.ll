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
  %"array" = alloca [3 x i32]
  %".2" = getelementptr [3 x i32], [3 x i32]* %"array", i32 0, i32 0
  store i32 0, i32* %".2"
  %".4" = getelementptr [3 x i32], [3 x i32]* %"array", i32 0, i32 1
  store i32 1, i32* %".4"
  %".6" = getelementptr [3 x i32], [3 x i32]* %"array", i32 0, i32 2
  store i32 2, i32* %".6"
  %"array_ptr" = alloca i32
  %"gep_array" = getelementptr [3 x i32], [3 x i32]* %"array", i32 0, i32 0
  %"array_element" = load i32, i32* %"gep_array"
  %".8" = ptrtoint i32* %"gep_array" to i32
  store i32 %".8", i32* %"array_ptr"
  %"a" = alloca i32
  %"array_ptr_load" = load i32, i32* %"array_ptr"
  %".10" = add i32 %"array_ptr_load", 2
  %".11" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a_load" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %"a_load")
  ;  Source: a
  %"a_load.1" = load i32, i32* %"a"
  ;  Source: array_ptr
  %"array_ptr_load.1" = load i32, i32* %"array_ptr"
  ;  Source: (array_ptr++)
  %".18" = load i32, i32* %"array_ptr"
  %".19" = add i32 %".18", 1
  store i32 %".19", i32* %"array_ptr"
  ;  Source: *(array_ptr++)
  ;  Source: a=*(array_ptr++);
  %".23" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: a
  %"a_load.2" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %"a_load.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"