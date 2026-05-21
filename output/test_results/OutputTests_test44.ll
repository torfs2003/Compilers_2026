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
  %"x" = alloca i32
  store i32 1, i32* %"x"
  %"y" = alloca i32
  %"x_load" = load i32, i32* %"x"
  store i32 %"x_load", i32* %"y"
  %"ptr1" = alloca i32*
  store i32* %"x", i32** %"ptr1"
  %"ptr2" = alloca i32*
  store i32* %"y", i32** %"ptr2"
  %".6" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: ptr1
  %"ptr1_load" = load i32*, i32** %"ptr1"
  ;  Source: ptr2
  %"ptr2_load" = load i32*, i32** %"ptr2"
  ;  Source: ptr1!=ptr2
  %".10" = ptrtoint i32* %"ptr1_load" to i32
  %".11" = ptrtoint i32* %"ptr2_load" to i32
  %".12" = icmp ne i32 %".10", %".11"
  %".13" = zext i1 %".12" to i32
  ;  Source: printf("%d\n",ptr1!=ptr2);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %".13")
  %".16" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: ptr1
  %"ptr1_load.1" = load i32*, i32** %"ptr1"
  ;  Source: ptr2
  %"ptr2_load.1" = load i32*, i32** %"ptr2"
  ;  Source: ptr1==ptr2
  %".20" = ptrtoint i32* %"ptr1_load.1" to i32
  %".21" = ptrtoint i32* %"ptr2_load.1" to i32
  %".22" = icmp eq i32 %".20", %".21"
  %".23" = zext i1 %".22" to i32
  ;  Source: printf("%d\n",ptr1==ptr2);
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 %".23")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"
@"str.1" = internal constant [4 x i8] c"%d\0a\00"