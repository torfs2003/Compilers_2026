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
  %"data" = alloca [5 x i32]
  store [5 x i32] zeroinitializer, [5 x i32]* %"data"
  %".3" = getelementptr [5 x i32], [5 x i32]* %"data", i32 0, i32 0
  store i32 1, i32* %".3"
  %".5" = getelementptr [5 x i32], [5 x i32]* %"data", i32 0, i32 1
  store i32 2, i32* %".5"
  %".7" = getelementptr [5 x i32], [5 x i32]* %"data", i32 0, i32 2
  store i32 3, i32* %".7"
  %".9" = getelementptr [5 x i32], [5 x i32]* %"data", i32 0, i32 3
  store i32 4, i32* %".9"
  %".11" = getelementptr [5 x i32], [5 x i32]* %"data", i32 0, i32 4
  store i32 5, i32* %".11"
  %"ptr" = alloca i32*
  %".13" = bitcast [5 x i32]* %"data" to i32*
  store i32* %".13", i32** %"ptr"
  %"i" = alloca i32
  ;  Source: i
  %"i_load" = load i32, i32* %"i"
  ;  Source: i=0
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i_load.1" = load i32, i32* %"i"
  %".19" = icmp slt i32 %"i_load.1", 4
  %".20" = zext i1 %".19" to i32
  %"whilecond" = icmp ne i32 %".20", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".22" = bitcast [25 x i8]* @"str" to i8*
  %"i_load.2" = load i32, i32* %"i"
  %"i_load.3" = load i32, i32* %"i"
  %".23" = add i32 %"i_load.3", 1
  %"ptr_load" = load i32*, i32** %"ptr"
  %"i_load.4" = load i32, i32* %"i"
  %".24" = getelementptr i32, i32* %"ptr_load", i32 %"i_load.4"
  %"ptr_load.1" = load i32*, i32** %"ptr"
  %"i_load.5" = load i32, i32* %"i"
  %".25" = getelementptr i32, i32* %"ptr_load.1", i32 %"i_load.5"
  %".26" = getelementptr i32, i32* %".25", i32 1
  %".27" = ptrtoint i32* %".24" to i32
  %".28" = ptrtoint i32* %".26" to i32
  %".29" = icmp ult i32 %".27", %".28"
  %".30" = zext i1 %".29" to i32
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %"i_load.2", i32 %".23", i32 %".30")
  %"i_load.6" = load i32, i32* %"i"
  %".32" = load i32, i32* %"i"
  %".33" = add i32 %".32", 1
  store i32 %".33", i32* %"i"
  br label %"while.cond"
while.end:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [25 x i8] c"ptr + %d < ptr + %d: %d\0a\00"