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
  %"array_2" = alloca [5 x i32]
  %".2" = getelementptr [5 x i32], [5 x i32]* %"array_2", i32 0, i32 0
  store i32 1, i32* %".2"
  %".4" = getelementptr [5 x i32], [5 x i32]* %"array_2", i32 0, i32 1
  store i32 2, i32* %".4"
  %".6" = getelementptr [5 x i32], [5 x i32]* %"array_2", i32 0, i32 2
  store i32 3, i32* %".6"
  %".8" = getelementptr [5 x i32], [5 x i32]* %"array_2", i32 0, i32 3
  store i32 4, i32* %".8"
  %".10" = getelementptr [5 x i32], [5 x i32]* %"array_2", i32 0, i32 4
  store i32 5, i32* %".10"
  %"i" = alloca i32
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: i=0
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.2" = load i32, i32* %"i"
  %".16" = icmp slt i32 %"i.2", 5
  %".17" = zext i1 %".16" to i32
  %"whilecond" = icmp ne i32 %".17", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".19" = bitcast [4 x i8]* @"str" to i8*
  %"i.3" = load i32, i32* %"i"
  %"gep_array" = getelementptr [5 x i32], [5 x i32]* %"array_2", i32 0, i32 %"i.3"
  %"array_element" = load i32, i32* %"gep_array"
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %"array_element")
  %"i.4" = load i32, i32* %"i"
  %".21" = load i32, i32* %"i"
  %".22" = add i32 %".21", 1
  store i32 %".22", i32* %"i"
  br label %"while.cond"
while.end:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d \00"