; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

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
  %"i.1" = load i32, i32* %"i"
  %".8" = icmp slt i32 %"i.1", 5
  %".9" = zext i1 %".8" to i32
  %"whilecond" = icmp ne i32 %".9", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"value.1" = load i32, i32* %"value"
  %"array_2.1" = load i32*, i32** %"array_2"
  %"i.2" = load i32, i32* %"i"
  %"gep_ptr" = getelementptr i32, i32* %"array_2.1", i32 %"i.2"
  %"array_element" = load i32, i32* %"gep_ptr"
  store i32 %"value.1", i32* %"gep_ptr"
  %"i.3" = load i32, i32* %"i"
  %".12" = load i32, i32* %"i"
  %".13" = add i32 %".12", 1
  store i32 %".13", i32* %"i"
  br label %"while.cond"
while.end:
  ;  Source: returnarray_2;
  %"array_2.2" = load i32*, i32** %"array_2"
  ret i32* %"array_2.2"
}

define i32 @"main"()
{
entry:
  %"array_2" = alloca [5 x i32]
  ;  Source: int*array_2[5];
  %"array" = alloca i32*
  ;  Source: array_2
  ;  Source: arrayCreator(array_2,5)
  %".5" = bitcast [5 x i32]* %"array_2" to i32*
  %".6" = call i32* @"arrayCreator"(i32* %".5", i32 5)
  ;  Source: int*array=arrayCreator(array_2,5);
  store i32* %".6", i32** %"array"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.1" = load i32, i32* %"i"
  %".11" = icmp slt i32 %"i.1", 5
  %".12" = zext i1 %".11" to i32
  %"whilecond" = icmp ne i32 %".12", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".14" = bitcast [4 x i8]* @"str" to i8*
  %"array.1" = load i32*, i32** %"array"
  %"i.2" = load i32, i32* %"i"
  %"gep_ptr" = getelementptr i32, i32* %"array.1", i32 %"i.2"
  %"array_element" = load i32, i32* %"gep_ptr"
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"array_element")
  %"i.3" = load i32, i32* %"i"
  %".16" = load i32, i32* %"i"
  %".17" = add i32 %".16", 1
  store i32 %".17", i32* %"i"
  br label %"while.cond"
while.end:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d \00"