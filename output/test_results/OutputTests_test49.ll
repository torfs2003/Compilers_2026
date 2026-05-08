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
  store i32 1, i32* %".2"
  %".4" = getelementptr [3 x i32], [3 x i32]* %"array", i32 0, i32 1
  store i32 2, i32* %".4"
  %".6" = getelementptr [3 x i32], [3 x i32]* %"array", i32 0, i32 2
  store i32 3, i32* %".6"
  %"ptr1" = alloca i32
  %"gep_array" = getelementptr [3 x i32], [3 x i32]* %"array", i32 0, i32 0
  %"array_element" = load i32, i32* %"gep_array"
  %".8" = ptrtoint i32* %"gep_array" to i32
  store i32 %".8", i32* %"ptr1"
  %"ptr2" = alloca i32
  %"gep_array.1" = getelementptr [3 x i32], [3 x i32]* %"array", i32 0, i32 1
  %"array_element.1" = load i32, i32* %"gep_array.1"
  %".10" = ptrtoint i32* %"gep_array.1" to i32
  store i32 %".10", i32* %"ptr2"
  %".12" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: ptr1
  %"ptr1_load" = load i32, i32* %"ptr1"
  ;  Source: ptr2
  %"ptr2_load" = load i32, i32* %"ptr2"
  ;  Source: ptr1<ptr2
  %".16" = icmp slt i32 %"ptr1_load", %"ptr2_load"
  %".17" = zext i1 %".16" to i32
  ;  Source: printf("%d\n",ptr1<ptr2);
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %".17")
  %".20" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: ptr1
  %"ptr1_load.1" = load i32, i32* %"ptr1"
  ;  Source: ptr2
  %"ptr2_load.1" = load i32, i32* %"ptr2"
  ;  Source: ptr1>ptr2
  %".24" = icmp sgt i32 %"ptr1_load.1", %"ptr2_load.1"
  %".25" = zext i1 %".24" to i32
  ;  Source: printf("%d\n",ptr1>ptr2);
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %".25")
  %".28" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: ptr1
  %"ptr1_load.2" = load i32, i32* %"ptr1"
  ;  Source: ptr2
  %"ptr2_load.2" = load i32, i32* %"ptr2"
  ;  Source: ptr1!=ptr2
  %".32" = icmp ne i32 %"ptr1_load.2", %"ptr2_load.2"
  %".33" = zext i1 %".32" to i32
  ;  Source: printf("%d\n",ptr1!=ptr2);
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 %".33")
  %".36" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: ptr1
  %"ptr1_load.3" = load i32, i32* %"ptr1"
  ;  Source: ptr2
  %"ptr2_load.3" = load i32, i32* %"ptr2"
  ;  Source: ptr1==ptr2
  %".40" = icmp eq i32 %"ptr1_load.3", %"ptr2_load.3"
  %".41" = zext i1 %".40" to i32
  ;  Source: printf("%d\n",ptr1==ptr2);
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %".41")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"
@"str.1" = internal constant [4 x i8] c"%d\0a\00"
@"str.2" = internal constant [4 x i8] c"%d\0a\00"
@"str.3" = internal constant [4 x i8] c"%d\0a\00"