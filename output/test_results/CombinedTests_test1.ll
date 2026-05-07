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
  %".2" = getelementptr [12 x i8], [12 x i8]* %"array", i32 0, i32 0
  store i8 104, i8* %".2"
  %".4" = getelementptr [12 x i8], [12 x i8]* %"array", i32 0, i32 1
  store i8 101, i8* %".4"
  %".6" = getelementptr [12 x i8], [12 x i8]* %"array", i32 0, i32 2
  store i8 108, i8* %".6"
  %".8" = getelementptr [12 x i8], [12 x i8]* %"array", i32 0, i32 3
  store i8 108, i8* %".8"
  %".10" = getelementptr [12 x i8], [12 x i8]* %"array", i32 0, i32 4
  store i8 111, i8* %".10"
  %".12" = getelementptr [12 x i8], [12 x i8]* %"array", i32 0, i32 5
  store i8 32, i8* %".12"
  %".14" = getelementptr [12 x i8], [12 x i8]* %"array", i32 0, i32 6
  store i8 119, i8* %".14"
  %".16" = getelementptr [12 x i8], [12 x i8]* %"array", i32 0, i32 7
  store i8 111, i8* %".16"
  %".18" = getelementptr [12 x i8], [12 x i8]* %"array", i32 0, i32 8
  store i8 114, i8* %".18"
  %".20" = getelementptr [12 x i8], [12 x i8]* %"array", i32 0, i32 9
  store i8 108, i8* %".20"
  %".22" = getelementptr [12 x i8], [12 x i8]* %"array", i32 0, i32 10
  store i8 100, i8* %".22"
  %".24" = getelementptr [12 x i8], [12 x i8]* %"array", i32 0, i32 11
  store i8 33, i8* %".24"
  %"ptr" = alloca i8*
  %".26" = bitcast [12 x i8]* %"array" to i8*
  store i8* %".26", i8** %"ptr"
  %"length" = alloca i32
  store i32 12, i32* %"length"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.1" = load i32, i32* %"i"
  %"length.1" = load i32, i32* %"length"
  %".31" = icmp slt i32 %"i.1", %"length.1"
  %".32" = zext i1 %".31" to i32
  %"whilecond" = icmp ne i32 %".32", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".34" = bitcast [3 x i8]* @"str" to i8*
  %"ptr.1" = load i8*, i8** %"ptr"
  %".35" = load i8*, i8** %"ptr"
  %"ptr_incdec" = getelementptr i8, i8* %".35", i32 1
  store i8* %"ptr_incdec", i8** %"ptr"
  %"deref_load" = load i8, i8* %".35"
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".34", i8 %"deref_load")
  %"i.2" = load i32, i32* %"i"
  %".38" = load i32, i32* %"i"
  %".39" = add i32 %".38", 1
  store i32 %".39", i32* %"i"
  br label %"while.cond"
while.end:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"