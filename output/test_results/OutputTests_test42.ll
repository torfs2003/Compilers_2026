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
  ;  Source: ptr1
  %"ptr1_load" = load i32, i32* %"ptr1"
  ;  Source: ptr1++;
  %".12" = load i32, i32* %"ptr1"
  %".13" = add i32 %".12", 1
  store i32 %".13", i32* %"ptr1"
  %"ptr2" = alloca i32
  %"gep_array.1" = getelementptr [3 x i32], [3 x i32]* %"array", i32 0, i32 1
  %"array_element.1" = load i32, i32* %"gep_array.1"
  %".15" = ptrtoint i32* %"gep_array.1" to i32
  store i32 %".15", i32* %"ptr2"
  %".17" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: ptr1
  %"ptr1_load.1" = load i32, i32* %"ptr1"
  ;  Source: ptr2
  %"ptr2_load" = load i32, i32* %"ptr2"
  ;  Source: ptr1<ptr2
  %".21" = icmp slt i32 %"ptr1_load.1", %"ptr2_load"
  %".22" = zext i1 %".21" to i32
  ;  Source: printf("%d\n",ptr1<ptr2);
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".17", i32 %".22")
  %".25" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: ptr1
  %"ptr1_load.2" = load i32, i32* %"ptr1"
  ;  Source: ptr2
  %"ptr2_load.1" = load i32, i32* %"ptr2"
  ;  Source: ptr1>ptr2
  %".29" = icmp sgt i32 %"ptr1_load.2", %"ptr2_load.1"
  %".30" = zext i1 %".29" to i32
  ;  Source: printf("%d\n",ptr1>ptr2);
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 %".30")
  %".33" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: ptr1
  %"ptr1_load.3" = load i32, i32* %"ptr1"
  ;  Source: ptr2
  %"ptr2_load.2" = load i32, i32* %"ptr2"
  ;  Source: ptr1!=ptr2
  %".37" = icmp ne i32 %"ptr1_load.3", %"ptr2_load.2"
  %".38" = zext i1 %".37" to i32
  ;  Source: printf("%d\n",ptr1!=ptr2);
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".33", i32 %".38")
  %".41" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: ptr1
  %"ptr1_load.4" = load i32, i32* %"ptr1"
  ;  Source: ptr2
  %"ptr2_load.3" = load i32, i32* %"ptr2"
  ;  Source: ptr1==ptr2
  %".45" = icmp eq i32 %"ptr1_load.4", %"ptr2_load.3"
  %".46" = zext i1 %".45" to i32
  ;  Source: printf("%d\n",ptr1==ptr2);
  %".48" = call i32 (i8*, ...) @"printf"(i8* %".41", i32 %".46")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"
@"str.1" = internal constant [4 x i8] c"%d\0a\00"
@"str.2" = internal constant [4 x i8] c"%d\0a\00"
@"str.3" = internal constant [4 x i8] c"%d\0a\00"