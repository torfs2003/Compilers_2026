; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"array" = alloca [3 x i32]
  ;  Source: intarray[3]={1,2,3};
  %".3" = getelementptr [3 x i32], [3 x i32]* %"array", i32 0, i32 0
  store i32 1, i32* %".3"
  %".5" = getelementptr [3 x i32], [3 x i32]* %"array", i32 0, i32 1
  store i32 2, i32* %".5"
  %".7" = getelementptr [3 x i32], [3 x i32]* %"array", i32 0, i32 2
  store i32 3, i32* %".7"
  %"ptr1" = alloca i32
  ;  Source: array
  ;  Source: array[0]
  %"gep_array" = getelementptr [3 x i32], [3 x i32]* %"array", i32 0, i32 0
  %"array_element" = load i32, i32* %"gep_array"
  ;  Source: &array[0]
  ;  Source: int*ptr1=&array[0];
  %".13" = ptrtoint i32* %"gep_array" to i32
  store i32 %".13", i32* %"ptr1"
  %"ptr2" = alloca i32
  ;  Source: array
  ;  Source: array[1]
  %"gep_array.1" = getelementptr [3 x i32], [3 x i32]* %"array", i32 0, i32 1
  %"array_element.1" = load i32, i32* %"gep_array.1"
  ;  Source: &array[1]
  ;  Source: int*ptr2=&array[1];
  %".19" = ptrtoint i32* %"gep_array.1" to i32
  store i32 %".19", i32* %"ptr2"
  %".21" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: ptr1
  %"ptr1.1" = load i32, i32* %"ptr1"
  ;  Source: ptr2
  %"ptr2.1" = load i32, i32* %"ptr2"
  ;  Source: ptr1<ptr2
  %".25" = icmp slt i32 %"ptr1.1", %"ptr2.1"
  %".26" = zext i1 %".25" to i32
  ;  Source: printf("%d\n",ptr1<ptr2);
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %".26")
  %".29" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: ptr1
  %"ptr1.2" = load i32, i32* %"ptr1"
  ;  Source: ptr2
  %"ptr2.2" = load i32, i32* %"ptr2"
  ;  Source: ptr1>ptr2
  %".33" = icmp sgt i32 %"ptr1.2", %"ptr2.2"
  %".34" = zext i1 %".33" to i32
  ;  Source: printf("%d\n",ptr1>ptr2);
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".29", i32 %".34")
  %".37" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: ptr1
  %"ptr1.3" = load i32, i32* %"ptr1"
  ;  Source: ptr2
  %"ptr2.3" = load i32, i32* %"ptr2"
  ;  Source: ptr1!=ptr2
  %".41" = icmp ne i32 %"ptr1.3", %"ptr2.3"
  %".42" = zext i1 %".41" to i32
  ;  Source: printf("%d\n",ptr1!=ptr2);
  %".44" = call i32 (i8*, ...) @"printf"(i8* %".37", i32 %".42")
  %".45" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: ptr1
  %"ptr1.4" = load i32, i32* %"ptr1"
  ;  Source: ptr2
  %"ptr2.4" = load i32, i32* %"ptr2"
  ;  Source: ptr1==ptr2
  %".49" = icmp eq i32 %"ptr1.4", %"ptr2.4"
  %".50" = zext i1 %".49" to i32
  ;  Source: printf("%d\n",ptr1==ptr2);
  %".52" = call i32 (i8*, ...) @"printf"(i8* %".45", i32 %".50")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"
@"str.1" = internal constant [4 x i8] c"%d\0a\00"
@"str.2" = internal constant [4 x i8] c"%d\0a\00"
@"str.3" = internal constant [4 x i8] c"%d\0a\00"