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

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"array" = alloca [2 x [2 x i32]]
  ;  Source: intarray[2][2]={{0,1},{2,3}};
  %".3" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"array", i32 0, i32 0, i32 0
  store i32 0, i32* %".3"
  %".5" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"array", i32 0, i32 0, i32 1
  store i32 1, i32* %".5"
  %".7" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"array", i32 0, i32 1, i32 0
  store i32 2, i32* %".7"
  %".9" = getelementptr [2 x [2 x i32]], [2 x [2 x i32]]* %"array", i32 0, i32 1, i32 1
  store i32 3, i32* %".9"
  %"ptr" = alloca i32*
  ;  Source: array
  ;  Source: &array
  ;  Source: int*ptr=&array;
  %".14" = bitcast [2 x [2 x i32]]* %"array" to i32*
  store i32* %".14", i32** %"ptr"
  %".16" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: ptr
  %"ptr.1" = load i32*, i32** %"ptr"
  ;  Source: (ptr+2)
  %".19" = getelementptr i32, i32* %"ptr.1", i32 2
  ;  Source: *(ptr+2)
  %"deref_load" = load i32, i32* %".19"
  ;  Source: printf("%d",*(ptr+2));
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 %"deref_load")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"