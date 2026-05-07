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
  %"x" = alloca i32
  ;  Source: intx=3;
  store i32 3, i32* %"x"
  %"ptr1" = alloca i32*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: int*ptr1=&x;
  store i32* %"x", i32** %"ptr1"
  %"ptr2" = alloca i32*
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: int*ptr2=&x;
  store i32* %"x", i32** %"ptr2"
  %".12" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: ptr1
  %"ptr1.1" = load i32*, i32** %"ptr1"
  ;  Source: ptr2
  %"ptr2.1" = load i32*, i32** %"ptr2"
  ;  Source: ptr1<ptr2
  %".16" = ptrtoint i32* %"ptr1.1" to i32
  %".17" = ptrtoint i32* %"ptr2.1" to i32
  %".18" = icmp ult i32 %".16", %".17"
  %".19" = zext i1 %".18" to i32
  ;  Source: printf("%d\n",ptr1<ptr2);
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %".19")
  %".22" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: ptr1
  %"ptr1.2" = load i32*, i32** %"ptr1"
  ;  Source: ptr2
  %"ptr2.2" = load i32*, i32** %"ptr2"
  ;  Source: ptr1>ptr2
  %".26" = ptrtoint i32* %"ptr1.2" to i32
  %".27" = ptrtoint i32* %"ptr2.2" to i32
  %".28" = icmp ugt i32 %".26", %".27"
  %".29" = zext i1 %".28" to i32
  ;  Source: printf("%d\n",ptr1>ptr2);
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %".29")
  %".32" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: ptr1
  %"ptr1.3" = load i32*, i32** %"ptr1"
  ;  Source: ptr2
  %"ptr2.3" = load i32*, i32** %"ptr2"
  ;  Source: ptr1!=ptr2
  %".36" = ptrtoint i32* %"ptr1.3" to i32
  %".37" = ptrtoint i32* %"ptr2.3" to i32
  %".38" = icmp ne i32 %".36", %".37"
  %".39" = zext i1 %".38" to i32
  ;  Source: printf("%d\n",ptr1!=ptr2);
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 %".39")
  %".42" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: ptr1
  %"ptr1.4" = load i32*, i32** %"ptr1"
  ;  Source: ptr2
  %"ptr2.4" = load i32*, i32** %"ptr2"
  ;  Source: ptr1==ptr2
  %".46" = ptrtoint i32* %"ptr1.4" to i32
  %".47" = ptrtoint i32* %"ptr2.4" to i32
  %".48" = icmp eq i32 %".46", %".47"
  %".49" = zext i1 %".48" to i32
  ;  Source: printf("%d\n",ptr1==ptr2);
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".42", i32 %".49")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"
@"str.1" = internal constant [4 x i8] c"%d\0a\00"
@"str.2" = internal constant [4 x i8] c"%d\0a\00"
@"str.3" = internal constant [4 x i8] c"%d\0a\00"