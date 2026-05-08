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
  %"array" = alloca [12 x i8]
  store [12 x i8] zeroinitializer, [12 x i8]* %"array"
  %".3" = getelementptr [12 x i8], [12 x i8]* %"array", i32 0, i32 0
  store i8 104, i8* %".3"
  %".5" = getelementptr [12 x i8], [12 x i8]* %"array", i32 0, i32 1
  store i8 101, i8* %".5"
  %".7" = getelementptr [12 x i8], [12 x i8]* %"array", i32 0, i32 2
  store i8 108, i8* %".7"
  %".9" = getelementptr [12 x i8], [12 x i8]* %"array", i32 0, i32 3
  store i8 108, i8* %".9"
  %".11" = getelementptr [12 x i8], [12 x i8]* %"array", i32 0, i32 4
  store i8 111, i8* %".11"
  %".13" = getelementptr [12 x i8], [12 x i8]* %"array", i32 0, i32 5
  store i8 32, i8* %".13"
  %".15" = getelementptr [12 x i8], [12 x i8]* %"array", i32 0, i32 6
  store i8 119, i8* %".15"
  %".17" = getelementptr [12 x i8], [12 x i8]* %"array", i32 0, i32 7
  store i8 111, i8* %".17"
  %".19" = getelementptr [12 x i8], [12 x i8]* %"array", i32 0, i32 8
  store i8 114, i8* %".19"
  %".21" = getelementptr [12 x i8], [12 x i8]* %"array", i32 0, i32 9
  store i8 108, i8* %".21"
  %".23" = getelementptr [12 x i8], [12 x i8]* %"array", i32 0, i32 10
  store i8 100, i8* %".23"
  %".25" = getelementptr [12 x i8], [12 x i8]* %"array", i32 0, i32 11
  store i8 33, i8* %".25"
  %"ptr" = alloca i8*
  %".27" = bitcast [12 x i8]* %"array" to i8*
  store i8* %".27", i8** %"ptr"
  %"length" = alloca i32
  store i32 12, i32* %"length"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i_load" = load i32, i32* %"i"
  %"length_load" = load i32, i32* %"length"
  %".32" = icmp slt i32 %"i_load", %"length_load"
  %".33" = zext i1 %".32" to i32
  %"whilecond" = icmp ne i32 %".33", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".35" = bitcast [3 x i8]* @"str" to i8*
  %"ptr_load" = load i8*, i8** %"ptr"
  %".36" = load i8*, i8** %"ptr"
  %"ptr_incdec" = getelementptr i8, i8* %".36", i32 1
  store i8* %"ptr_incdec", i8** %"ptr"
  %"deref_load" = load i8, i8* %".36"
  %".38" = sext i8 %"deref_load" to i32
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".35", i32 %".38")
  %"i_load.1" = load i32, i32* %"i"
  %".40" = load i32, i32* %"i"
  %".41" = add i32 %".40", 1
  store i32 %".41", i32* %"i"
  br label %"while.cond"
while.end:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"