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
  %".2" = getelementptr [5 x i32], [5 x i32]* %"data", i32 0, i32 0
  store i32 1, i32* %".2"
  %".4" = getelementptr [5 x i32], [5 x i32]* %"data", i32 0, i32 1
  store i32 2, i32* %".4"
  %".6" = getelementptr [5 x i32], [5 x i32]* %"data", i32 0, i32 2
  store i32 3, i32* %".6"
  %".8" = getelementptr [5 x i32], [5 x i32]* %"data", i32 0, i32 3
  store i32 4, i32* %".8"
  %".10" = getelementptr [5 x i32], [5 x i32]* %"data", i32 0, i32 4
  store i32 5, i32* %".10"
  %"ptr" = alloca i32*
  %".12" = bitcast [5 x i32]* %"data" to i32*
  store i32* %".12", i32** %"ptr"
  %"i" = alloca i32
  ;  Source: i
  %"i_load" = load i32, i32* %"i"
  ;  Source: i=0
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i_load.1" = load i32, i32* %"i"
  %".18" = icmp slt i32 %"i_load.1", 4
  %".19" = zext i1 %".18" to i32
  %"whilecond" = icmp ne i32 %".19", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".21" = bitcast [25 x i8]* @"str" to i8*
  %"i_load.2" = load i32, i32* %"i"
  %"i_load.3" = load i32, i32* %"i"
  %".22" = add i32 %"i_load.3", 1
  %"ptr_load" = load i32*, i32** %"ptr"
  %"i_load.4" = load i32, i32* %"i"
  %".23" = getelementptr i32, i32* %"ptr_load", i32 %"i_load.4"
  %"ptr_load.1" = load i32*, i32** %"ptr"
  %"i_load.5" = load i32, i32* %"i"
  %".24" = getelementptr i32, i32* %"ptr_load.1", i32 %"i_load.5"
  %".25" = getelementptr i32, i32* %".24", i32 1
  %".26" = ptrtoint i32* %".23" to i32
  %".27" = ptrtoint i32* %".25" to i32
  %".28" = icmp ult i32 %".26", %".27"
  %".29" = zext i1 %".28" to i32
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %"i_load.2", i32 %".22", i32 %".29")
  %"i_load.6" = load i32, i32* %"i"
  %".31" = load i32, i32* %"i"
  %".32" = add i32 %".31", 1
  store i32 %".32", i32* %"i"
  br label %"while.cond"
while.end:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [25 x i8] c"ptr + %d < ptr + %d: %d\0a\00"