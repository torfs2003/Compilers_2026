; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define void @"printArr"(i32* %".1", i32 %".2")
{
entry:
  %"arr" = alloca i32*
  store i32* %".1", i32** %"arr"
  %"length" = alloca i32
  store i32 %".2", i32* %"length"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  ;  Source: i
  %"i_load" = load i32, i32* %"i"
  ;  Source: i=0
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i_load.1" = load i32, i32* %"i"
  %"length_load" = load i32, i32* %"length"
  %".11" = icmp slt i32 %"i_load.1", %"length_load"
  %".12" = zext i1 %".11" to i32
  %"whilecond" = icmp ne i32 %".12", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".14" = bitcast [3 x i8]* @"str" to i8*
  %"arr_load" = load i32*, i32** %"arr"
  %".15" = load i32*, i32** %"arr"
  %"ptr_incdec" = getelementptr i32, i32* %".15", i32 1
  store i32* %"ptr_incdec", i32** %"arr"
  %"deref_load" = load i32, i32* %".15"
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"deref_load")
  %"i_load.2" = load i32, i32* %"i"
  %".18" = load i32, i32* %"i"
  %".19" = add i32 %".18", 1
  store i32 %".19", i32* %"i"
  br label %"while.cond"
while.end:
  ret void
}

define i32 @"main"()
{
entry:
  %"array" = alloca [12 x i32]
  %".2" = getelementptr [12 x i32], [12 x i32]* %"array", i32 0, i32 0
  store i32 1, i32* %".2"
  %".4" = getelementptr [12 x i32], [12 x i32]* %"array", i32 0, i32 1
  store i32 2, i32* %".4"
  %".6" = getelementptr [12 x i32], [12 x i32]* %"array", i32 0, i32 2
  store i32 3, i32* %".6"
  %".8" = getelementptr [12 x i32], [12 x i32]* %"array", i32 0, i32 3
  store i32 4, i32* %".8"
  %".10" = getelementptr [12 x i32], [12 x i32]* %"array", i32 0, i32 4
  store i32 5, i32* %".10"
  %".12" = getelementptr [12 x i32], [12 x i32]* %"array", i32 0, i32 5
  store i32 6, i32* %".12"
  %".14" = getelementptr [12 x i32], [12 x i32]* %"array", i32 0, i32 6
  store i32 7, i32* %".14"
  %".16" = getelementptr [12 x i32], [12 x i32]* %"array", i32 0, i32 7
  store i32 8, i32* %".16"
  %".18" = getelementptr [12 x i32], [12 x i32]* %"array", i32 0, i32 8
  store i32 9, i32* %".18"
  %".20" = getelementptr [12 x i32], [12 x i32]* %"array", i32 0, i32 9
  store i32 10, i32* %".20"
  %".22" = getelementptr [12 x i32], [12 x i32]* %"array", i32 0, i32 10
  store i32 11, i32* %".22"
  %".24" = getelementptr [12 x i32], [12 x i32]* %"array", i32 0, i32 11
  store i32 12, i32* %".24"
  ;  Source: array
  ;  Source: printArr(array,12);
  %".28" = bitcast [12 x i32]* %"array" to i32*
  call void @"printArr"(i32* %".28", i32 12)
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"