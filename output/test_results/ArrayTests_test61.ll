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
  %"result" = alloca [20 x i32]
  %".2" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 0
  store i32 1, i32* %".2"
  %".4" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 1
  store i32 2, i32* %".4"
  %".6" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 2
  store i32 3, i32* %".6"
  %".8" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 3
  store i32 4, i32* %".8"
  %".10" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 4
  store i32 5, i32* %".10"
  %".12" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 5
  store i32 6, i32* %".12"
  %".14" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 6
  store i32 7, i32* %".14"
  %".16" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 7
  store i32 8, i32* %".16"
  %".18" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 8
  store i32 9, i32* %".18"
  %".20" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 9
  store i32 10, i32* %".20"
  %".22" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 10
  store i32 11, i32* %".22"
  %".24" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 11
  store i32 12, i32* %".24"
  %".26" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 12
  store i32 13, i32* %".26"
  %".28" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 13
  store i32 14, i32* %".28"
  %".30" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 14
  store i32 15, i32* %".30"
  %".32" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 15
  store i32 16, i32* %".32"
  %".34" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 16
  store i32 17, i32* %".34"
  %".36" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 17
  store i32 18, i32* %".36"
  %".38" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 18
  store i32 19, i32* %".38"
  %".40" = getelementptr [20 x i32], [20 x i32]* %"result", i32 0, i32 19
  store i32 20, i32* %".40"
  %"passed" = alloca i32*
  %".42" = bitcast [20 x i32]* %"result" to i32*
  store i32* %".42", i32** %"passed"
  ;  Source: passed
  %"passed_load" = load i32*, i32** %"passed"
  ;  Source: passed++;
  %".46" = load i32*, i32** %"passed"
  %"ptr_incdec" = getelementptr i32, i32* %".46", i32 1
  store i32* %"ptr_incdec", i32** %"passed"
  %".48" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: passed
  %"passed_load.1" = load i32*, i32** %"passed"
  ;  Source: *passed
  %"deref_load" = load i32, i32* %"passed_load.1"
  ;  Source: printf("%d",*passed);
  %".52" = call i32 (i8*, ...) @"printf"(i8* %".48", i32 %"deref_load")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"