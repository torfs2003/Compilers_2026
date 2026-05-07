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
  %"num" = alloca i32
  ;  Source: intnum=10;
  store i32 10, i32* %"num"
  %"ptr" = alloca i32*
  ;  Source: num
  %"num.1" = load i32, i32* %"num"
  ;  Source: &num
  ;  Source: int*ptr=&num;
  store i32* %"num", i32** %"ptr"
  %"constPtr" = alloca i32*
  ;  Source: ptr
  %"ptr.1" = load i32*, i32** %"ptr"
  ;  Source: (constint*)ptr
  %".10" = ptrtoint i32* %"ptr.1" to i32
  ;  Source: constint*constPtr=(constint*)ptr;
  %".12" = inttoptr i32 %".10" to i32*
  store i32* %".12", i32** %"constPtr"
  %".14" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: constPtr
  %"constPtr.1" = load i32*, i32** %"constPtr"
  ;  Source: *constPtr
  %"deref_load" = load i32, i32* %"constPtr.1"
  ;  Source: printf("%d\n",*constPtr);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"deref_load")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"