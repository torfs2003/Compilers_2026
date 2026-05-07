; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare void @"free"(i8* %".1")

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
  %"ptr1" = alloca i32*
  ;  Source: array
  ;  Source: array[0]
  %"decay_left" = getelementptr [3 x i32], [3 x i32]* %"array", i32 0, i32 0
  %"gep_ptr" = getelementptr i32, i32* %"decay_left", i32 0
  %"array_element" = load i32, i32* %"gep_ptr"
  ;  Source: &array[0]
  ;  Source: int*ptr1=&array[0];
  store i32* %"gep_ptr", i32** %"ptr1"
  %"ptr2" = alloca i32*
  ;  Source: array
  ;  Source: array[1]
  %"decay_left.1" = getelementptr [3 x i32], [3 x i32]* %"array", i32 0, i32 0
  %"gep_ptr.1" = getelementptr i32, i32* %"decay_left.1", i32 1
  %"array_element.1" = load i32, i32* %"gep_ptr.1"
  ;  Source: &array[1]
  ;  Source: int*ptr2=&array[1];
  store i32* %"gep_ptr.1", i32** %"ptr2"
  %".19" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: ptr1
  %"ptr1.1" = load i32*, i32** %"ptr1"
  ;  Source: ptr2
  %"ptr2.1" = load i32*, i32** %"ptr2"
  ;  Source: ptr1<ptr2
  %".23" = ptrtoint i32* %"ptr1.1" to i32
  %".24" = ptrtoint i32* %"ptr2.1" to i32
  %".25" = icmp ult i32 %".23", %".24"
  %".26" = zext i1 %".25" to i32
  ;  Source: printf("%d\n",ptr1<ptr2);
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %".26")
  %".29" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: ptr1
  %"ptr1.2" = load i32*, i32** %"ptr1"
  ;  Source: ptr2
  %"ptr2.2" = load i32*, i32** %"ptr2"
  ;  Source: ptr1>ptr2
  %".33" = ptrtoint i32* %"ptr1.2" to i32
  %".34" = ptrtoint i32* %"ptr2.2" to i32
  %".35" = icmp ugt i32 %".33", %".34"
  %".36" = zext i1 %".35" to i32
  ;  Source: printf("%d\n",ptr1>ptr2);
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".29", i32 %".36")
  %".39" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: ptr1
  %"ptr1.3" = load i32*, i32** %"ptr1"
  ;  Source: ptr2
  %"ptr2.3" = load i32*, i32** %"ptr2"
  ;  Source: ptr1!=ptr2
  %".43" = ptrtoint i32* %"ptr1.3" to i32
  %".44" = ptrtoint i32* %"ptr2.3" to i32
  %".45" = icmp ne i32 %".43", %".44"
  %".46" = zext i1 %".45" to i32
  ;  Source: printf("%d\n",ptr1!=ptr2);
  %".48" = call i32 (i8*, ...) @"printf"(i8* %".39", i32 %".46")
  %".49" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: ptr1
  %"ptr1.4" = load i32*, i32** %"ptr1"
  ;  Source: ptr2
  %"ptr2.4" = load i32*, i32** %"ptr2"
  ;  Source: ptr1==ptr2
  %".53" = ptrtoint i32* %"ptr1.4" to i32
  %".54" = ptrtoint i32* %"ptr2.4" to i32
  %".55" = icmp eq i32 %".53", %".54"
  %".56" = zext i1 %".55" to i32
  ;  Source: printf("%d\n",ptr1==ptr2);
  %".58" = call i32 (i8*, ...) @"printf"(i8* %".49", i32 %".56")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"
@"str.1" = internal constant [4 x i8] c"%d\0a\00"
@"str.2" = internal constant [4 x i8] c"%d\0a\00"
@"str.3" = internal constant [4 x i8] c"%d\0a\00"