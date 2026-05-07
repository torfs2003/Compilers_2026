; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
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
  ;  Source: ptr1
  %"ptr1.1" = load i32*, i32** %"ptr1"
  ;  Source: ptr1++;
  %".16" = load i32*, i32** %"ptr1"
  %".17" = getelementptr i32, i32* %".16", i32 1
  store i32* %".17", i32** %"ptr1"
  %"ptr2" = alloca i32*
  ;  Source: array
  ;  Source: array[1]
  %"decay_left.1" = getelementptr [3 x i32], [3 x i32]* %"array", i32 0, i32 0
  %"gep_ptr.1" = getelementptr i32, i32* %"decay_left.1", i32 1
  %"array_element.1" = load i32, i32* %"gep_ptr.1"
  ;  Source: &array[1]
  ;  Source: int*ptr2=&array[1];
  store i32* %"gep_ptr.1", i32** %"ptr2"
  %".24" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: ptr1
  %"ptr1.2" = load i32*, i32** %"ptr1"
  ;  Source: ptr2
  %"ptr2.1" = load i32*, i32** %"ptr2"
  ;  Source: ptr1<ptr2
  %".28" = ptrtoint i32* %"ptr1.2" to i32
  %".29" = ptrtoint i32* %"ptr2.1" to i32
  %".30" = icmp ult i32 %".28", %".29"
  %".31" = zext i1 %".30" to i32
  ;  Source: printf("%d\n",ptr1<ptr2);
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 %".31")
  %".34" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: ptr1
  %"ptr1.3" = load i32*, i32** %"ptr1"
  ;  Source: ptr2
  %"ptr2.2" = load i32*, i32** %"ptr2"
  ;  Source: ptr1>ptr2
  %".38" = ptrtoint i32* %"ptr1.3" to i32
  %".39" = ptrtoint i32* %"ptr2.2" to i32
  %".40" = icmp ugt i32 %".38", %".39"
  %".41" = zext i1 %".40" to i32
  ;  Source: printf("%d\n",ptr1>ptr2);
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".34", i32 %".41")
  %".44" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: ptr1
  %"ptr1.4" = load i32*, i32** %"ptr1"
  ;  Source: ptr2
  %"ptr2.3" = load i32*, i32** %"ptr2"
  ;  Source: ptr1!=ptr2
  %".48" = ptrtoint i32* %"ptr1.4" to i32
  %".49" = ptrtoint i32* %"ptr2.3" to i32
  %".50" = icmp ne i32 %".48", %".49"
  %".51" = zext i1 %".50" to i32
  ;  Source: printf("%d\n",ptr1!=ptr2);
  %".53" = call i32 (i8*, ...) @"printf"(i8* %".44", i32 %".51")
  %".54" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: ptr1
  %"ptr1.5" = load i32*, i32** %"ptr1"
  ;  Source: ptr2
  %"ptr2.4" = load i32*, i32** %"ptr2"
  ;  Source: ptr1==ptr2
  %".58" = ptrtoint i32* %"ptr1.5" to i32
  %".59" = ptrtoint i32* %"ptr2.4" to i32
  %".60" = icmp eq i32 %".58", %".59"
  %".61" = zext i1 %".60" to i32
  ;  Source: printf("%d\n",ptr1==ptr2);
  %".63" = call i32 (i8*, ...) @"printf"(i8* %".54", i32 %".61")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"
@"str.1" = internal constant [4 x i8] c"%d\0a\00"
@"str.2" = internal constant [4 x i8] c"%d\0a\00"
@"str.3" = internal constant [4 x i8] c"%d\0a\00"