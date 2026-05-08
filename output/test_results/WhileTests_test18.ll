; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32* @"arrayCreator"(i32* %".1", i32 %".2")
{
entry:
  %"array_2" = alloca i32*
  store i32* %".1", i32** %"array_2"
  %"value" = alloca i32
  store i32 %".2", i32* %"value"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i_load" = load i32, i32* %"i"
  %".8" = icmp slt i32 %"i_load", 5
  %".9" = zext i1 %".8" to i32
  %"whilecond" = icmp ne i32 %".9", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"value_load" = load i32, i32* %"value"
  %"array_2_load" = load i32*, i32** %"array_2"
  %"i_load.1" = load i32, i32* %"i"
  %"gep_ptr" = getelementptr i32, i32* %"array_2_load", i32 %"i_load.1"
  %"array_element" = load i32, i32* %"gep_ptr"
  store i32 %"value_load", i32* %"gep_ptr"
  %"i_load.2" = load i32, i32* %"i"
  %".12" = load i32, i32* %"i"
  %".13" = add i32 %".12", 1
  store i32 %".13", i32* %"i"
  br label %"while.cond"
while.end:
  ;  Source: returnarray_2;
  %"array_2_load.1" = load i32*, i32** %"array_2"
  ret i32* %"array_2_load.1"
}

define i32 @"main"()
{
entry:
  %"array_2" = alloca [5 x i32]
  %"array" = alloca i32*
  %".2" = bitcast [5 x i32]* %"array_2" to i32*
  %".3" = call i32* @"arrayCreator"(i32* %".2", i32 5)
  store i32* %".3", i32** %"array"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i_load" = load i32, i32* %"i"
  %".7" = icmp slt i32 %"i_load", 5
  %".8" = zext i1 %".7" to i32
  %"whilecond" = icmp ne i32 %".8", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".10" = bitcast [4 x i8]* @"str" to i8*
  %"array_load" = load i32*, i32** %"array"
  %"i_load.1" = load i32, i32* %"i"
  %"gep_ptr" = getelementptr i32, i32* %"array_load", i32 %"i_load.1"
  %"array_element" = load i32, i32* %"gep_ptr"
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %"array_element")
  %"i_load.2" = load i32, i32* %"i"
  %".12" = load i32, i32* %"i"
  %".13" = add i32 %".12", 1
  store i32 %".13", i32* %"i"
  br label %"while.cond"
while.end:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d \00"