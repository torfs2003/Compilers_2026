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
  store i32 1, i32* %".3"
  %".5" = getelementptr [3 x i32], [3 x i32]* %"array", i32 0, i32 1
  store i32 2, i32* %".5"
  %".7" = getelementptr [3 x i32], [3 x i32]* %"array", i32 0, i32 2
  store i32 3, i32* %".7"
  %"ptr1" = alloca i32
  %"gep_array" = getelementptr [3 x i32], [3 x i32]* %"array", i32 0, i32 0
  %"array_element" = load i32, i32* %"gep_array"
  %".9" = ptrtoint i32* %"gep_array" to i32
  store i32 %".9", i32* %"ptr1"
  %"ptr2" = alloca i32
  %"gep_array.1" = getelementptr [3 x i32], [3 x i32]* %"array", i32 0, i32 1
  %"array_element.1" = load i32, i32* %"gep_array.1"
  %".11" = ptrtoint i32* %"gep_array.1" to i32
  store i32 %".11", i32* %"ptr2"
  %".13" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: ptr1
  %"ptr1_load" = load i32, i32* %"ptr1"
  ;  Source: ptr2
  %"ptr2_load" = load i32, i32* %"ptr2"
  ;  Source: ptr1<ptr2
  %".17" = icmp slt i32 %"ptr1_load", %"ptr2_load"
  %".18" = zext i1 %".17" to i32
  ;  Source: printf("%d\n",ptr1<ptr2);
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %".18")
  %".21" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: ptr1
  %"ptr1_load.1" = load i32, i32* %"ptr1"
  ;  Source: ptr2
  %"ptr2_load.1" = load i32, i32* %"ptr2"
  ;  Source: ptr1>ptr2
  %".25" = icmp sgt i32 %"ptr1_load.1", %"ptr2_load.1"
  %".26" = zext i1 %".25" to i32
  ;  Source: printf("%d\n",ptr1>ptr2);
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %".26")
  %".29" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: ptr1
  %"ptr1_load.2" = load i32, i32* %"ptr1"
  ;  Source: ptr2
  %"ptr2_load.2" = load i32, i32* %"ptr2"
  ;  Source: ptr1!=ptr2
  %".33" = icmp ne i32 %"ptr1_load.2", %"ptr2_load.2"
  %".34" = zext i1 %".33" to i32
  ;  Source: printf("%d\n",ptr1!=ptr2);
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".29", i32 %".34")
  %".37" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: ptr1
  %"ptr1_load.3" = load i32, i32* %"ptr1"
  ;  Source: ptr2
  %"ptr2_load.3" = load i32, i32* %"ptr2"
  ;  Source: ptr1==ptr2
  %".41" = icmp eq i32 %"ptr1_load.3", %"ptr2_load.3"
  %".42" = zext i1 %".41" to i32
  ;  Source: printf("%d\n",ptr1==ptr2);
  %".44" = call i32 (i8*, ...) @"printf"(i8* %".37", i32 %".42")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"
@"str.1" = internal constant [4 x i8] c"%d\0a\00"
@"str.2" = internal constant [4 x i8] c"%d\0a\00"
@"str.3" = internal constant [4 x i8] c"%d\0a\00"