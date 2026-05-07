; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 3, i32* %"x"
  %"ptr1" = alloca i32*
  store i32* %"x", i32** %"ptr1"
  %"ptr2" = alloca i32*
  store i32* %"x", i32** %"ptr2"
  %".5" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: ptr1
  %"ptr1.1" = load i32*, i32** %"ptr1"
  ;  Source: ptr2
  %"ptr2.1" = load i32*, i32** %"ptr2"
  ;  Source: ptr1<ptr2
  %".9" = ptrtoint i32* %"ptr1.1" to i32
  %".10" = ptrtoint i32* %"ptr2.1" to i32
  %".11" = icmp ult i32 %".9", %".10"
  %".12" = zext i1 %".11" to i32
  ;  Source: printf("%d\n",ptr1<ptr2);
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %".12")
  %".15" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: ptr1
  %"ptr1.2" = load i32*, i32** %"ptr1"
  ;  Source: ptr2
  %"ptr2.2" = load i32*, i32** %"ptr2"
  ;  Source: ptr1>ptr2
  %".19" = ptrtoint i32* %"ptr1.2" to i32
  %".20" = ptrtoint i32* %"ptr2.2" to i32
  %".21" = icmp ugt i32 %".19", %".20"
  %".22" = zext i1 %".21" to i32
  ;  Source: printf("%d\n",ptr1>ptr2);
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %".22")
  %".25" = bitcast [4 x i8]* @"str.2" to i8*
  ;  Source: ptr1
  %"ptr1.3" = load i32*, i32** %"ptr1"
  ;  Source: ptr2
  %"ptr2.3" = load i32*, i32** %"ptr2"
  ;  Source: ptr1!=ptr2
  %".29" = ptrtoint i32* %"ptr1.3" to i32
  %".30" = ptrtoint i32* %"ptr2.3" to i32
  %".31" = icmp ne i32 %".29", %".30"
  %".32" = zext i1 %".31" to i32
  ;  Source: printf("%d\n",ptr1!=ptr2);
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 %".32")
  %".35" = bitcast [4 x i8]* @"str.3" to i8*
  ;  Source: ptr1
  %"ptr1.4" = load i32*, i32** %"ptr1"
  ;  Source: ptr2
  %"ptr2.4" = load i32*, i32** %"ptr2"
  ;  Source: ptr1==ptr2
  %".39" = ptrtoint i32* %"ptr1.4" to i32
  %".40" = ptrtoint i32* %"ptr2.4" to i32
  %".41" = icmp eq i32 %".39", %".40"
  %".42" = zext i1 %".41" to i32
  ;  Source: printf("%d\n",ptr1==ptr2);
  %".44" = call i32 (i8*, ...) @"printf"(i8* %".35", i32 %".42")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"
@"str.1" = internal constant [4 x i8] c"%d\0a\00"
@"str.2" = internal constant [4 x i8] c"%d\0a\00"
@"str.3" = internal constant [4 x i8] c"%d\0a\00"