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
  %"array" = alloca [2 x [2 x i32]]
  %".2" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"array", i32 0, i32 0, i32 0
  store i32 0, i32* %".2"
  %".4" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"array", i32 0, i32 0, i32 1
  store i32 1, i32* %".4"
  %".6" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"array", i32 0, i32 1, i32 0
  store i32 2, i32* %".6"
  %".8" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"array", i32 0, i32 1, i32 1
  store i32 3, i32* %".8"
  %"ptr" = alloca i32*
  %".10" = bitcast [2 x [2 x i32]]* %"array" to i32*
  store i32* %".10", i32** %"ptr"
  %".12" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: ptr
  %"ptr_load" = load i32*, i32** %"ptr"
  ;  Source: (ptr+2)
  %".15" = getelementptr i32, i32* %"ptr_load", i32 2
  ;  Source: *(ptr+2)
  %"deref_load" = load i32, i32* %".15"
  ;  Source: printf("%d",*(ptr+2));
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"deref_load")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"