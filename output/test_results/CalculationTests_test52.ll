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
  store [3 x i32] zeroinitializer, [3 x i32]* %"array"
  %".3" = getelementptr [3 x i32], [3 x i32]* %"array", i32 0, i32 0
  store i32 0, i32* %".3"
  %".5" = getelementptr [3 x i32], [3 x i32]* %"array", i32 0, i32 1
  store i32 1, i32* %".5"
  %".7" = getelementptr [3 x i32], [3 x i32]* %"array", i32 0, i32 2
  store i32 2, i32* %".7"
  %"array_ptr" = alloca i32
  %"gep_array" = getelementptr [3 x i32], [3 x i32]* %"array", i32 0, i32 0
  %"array_element" = load i32, i32* %"gep_array"
  %".9" = ptrtoint i32* %"gep_array" to i32
  store i32 %".9", i32* %"array_ptr"
  %"a" = alloca i32
  %"array_ptr_load" = load i32, i32* %"array_ptr"
  %".11" = add i32 %"array_ptr_load", 2
  %".12" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a_load" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"a_load")
  ;  Source: a
  %"a_load.1" = load i32, i32* %"a"
  ;  Source: array_ptr
  %"array_ptr_load.1" = load i32, i32* %"array_ptr"
  ;  Source: (array_ptr++)
  %".19" = load i32, i32* %"array_ptr"
  %".20" = add i32 %".19", 1
  store i32 %".20", i32* %"array_ptr"
  ;  Source: *(array_ptr++)
  ;  Source: a=*(array_ptr++);
  %".24" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: a
  %"a_load.2" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 %"a_load.2")
  ;  Source: a
  %"a_load.3" = load i32, i32* %"a"
  ;  Source: array_ptr
  %"array_ptr_load.2" = load i32, i32* %"array_ptr"
  ;  Source: (array_ptr-1)
  %".31" = sub i32 %"array_ptr_load.2", 1
  ;  Source: *(array_ptr-1)
  ;  Source: a=*(array_ptr-1);
  %".34" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: a
  %"a_load.4" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".34", i32 %"a_load.4")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"