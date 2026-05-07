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
  ;  Source: ptr1
  %"ptr1.1" = load i32, i32* %"ptr1"
  ;  Source: ptr1++;
  %".17" = load i32, i32* %"ptr1"
  %".18" = add i32 %".17", 1
  store i32 %".18", i32* %"ptr1"
  %"ptr2" = alloca i32
  ;  Source: array
  ;  Source: array[1]
  %"gep_array.1" = getelementptr [3 x i32], [3 x i32]* %"array", i32 0, i32 1
  %"array_element.1" = load i32, i32* %"gep_array.1"
  ;  Source: &array[1]
  ;  Source: int*ptr2=&array[1];
  %".24" = ptrtoint i32* %"gep_array.1" to i32
  store i32 %".24", i32* %"ptr2"
  %".26" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: ptr1
  %"ptr1.2" = load i32, i32* %"ptr1"
  ;  Source: ptr2
  %"ptr2.1" = load i32, i32* %"ptr2"
  ;  Source: ptr1<ptr2
  %".30" = icmp slt i32 %"ptr1.2", %"ptr2.1"
  %".31" = zext i1 %".30" to i32
  ;  Source: printf("%d\n",ptr1<ptr2);
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 %".31")
  %".34" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: ptr1
  %"ptr1.3" = load i32, i32* %"ptr1"
  ;  Source: ptr2
  %"ptr2.2" = load i32, i32* %"ptr2"
  ;  Source: ptr1>ptr2
  %".38" = icmp sgt i32 %"ptr1.3", %"ptr2.2"
  %".39" = zext i1 %".38" to i32
  ;  Source: printf("%d\n",ptr1>ptr2);
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".34", i32 %".39")
  %".42" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: ptr1
  %"ptr1.4" = load i32, i32* %"ptr1"
  ;  Source: ptr2
  %"ptr2.3" = load i32, i32* %"ptr2"
  ;  Source: ptr1!=ptr2
  %".46" = icmp ne i32 %"ptr1.4", %"ptr2.3"
  %".47" = zext i1 %".46" to i32
  ;  Source: printf("%d\n",ptr1!=ptr2);
  %".49" = call i32 (i8*, ...) @"printf"(i8* %".42", i32 %".47")
  %".50" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: ptr1
  %"ptr1.5" = load i32, i32* %"ptr1"
  ;  Source: ptr2
  %"ptr2.4" = load i32, i32* %"ptr2"
  ;  Source: ptr1==ptr2
  %".54" = icmp eq i32 %"ptr1.5", %"ptr2.4"
  %".55" = zext i1 %".54" to i32
  ;  Source: printf("%d\n",ptr1==ptr2);
  %".57" = call i32 (i8*, ...) @"printf"(i8* %".50", i32 %".55")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"
@"str.1" = internal constant [4 x i8] c"%d\0a\00"
@"str.2" = internal constant [4 x i8] c"%d\0a\00"
@"str.3" = internal constant [4 x i8] c"%d\0a\00"