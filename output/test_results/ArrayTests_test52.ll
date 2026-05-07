; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"array_2" = alloca [5 x i32]
  ;  Source: intarray_2[5]={1,2,3,4,5};
  %".3" = getelementptr [5 x i32], [5 x i32]* %"array_2", i32 0, i32 0
  store i32 1, i32* %".3"
  %".5" = getelementptr [5 x i32], [5 x i32]* %"array_2", i32 0, i32 1
  store i32 2, i32* %".5"
  %".7" = getelementptr [5 x i32], [5 x i32]* %"array_2", i32 0, i32 2
  store i32 3, i32* %".7"
  %".9" = getelementptr [5 x i32], [5 x i32]* %"array_2", i32 0, i32 3
  store i32 4, i32* %".9"
  %".11" = getelementptr [5 x i32], [5 x i32]* %"array_2", i32 0, i32 4
  store i32 5, i32* %".11"
  %"i" = alloca i32
  ;  Source: inti;
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: i=0
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.2" = load i32, i32* %"i"
  %".18" = icmp slt i32 %"i.2", 5
  %".19" = zext i1 %".18" to i32
  %"whilecond" = icmp ne i32 %".19", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".21" = bitcast [4 x i8]* @"str" to i8*
  %"i.3" = load i32, i32* %"i"
  %"decay_left" = getelementptr [5 x i32], [5 x i32]* %"array_2", i32 0, i32 0
  %"gep_ptr" = getelementptr i32, i32* %"decay_left", i32 %"i.3"
  %"array_element" = load i32, i32* %"gep_ptr"
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %"array_element")
  %"i.4" = load i32, i32* %"i"
  %".23" = load i32, i32* %"i"
  %".24" = add i32 %".23", 1
  store i32 %".24", i32* %"i"
  br label %"while.cond"
while.end:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d \00"