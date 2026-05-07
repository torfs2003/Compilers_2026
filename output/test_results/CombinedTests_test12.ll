; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define void @"printArr"(i32* %".1", i32 %".2")
{
entry:
  %"arr" = alloca i32*
  store i32* %".1", i32** %"arr"
  %"length" = alloca i32
  store i32 %".2", i32* %"length"
  %"i" = alloca i32
  ;  Source: inti=0;
  store i32 0, i32* %"i"
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: i=0
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.2" = load i32, i32* %"i"
  %"length.1" = load i32, i32* %"length"
  %".12" = icmp slt i32 %"i.2", %"length.1"
  %".13" = zext i1 %".12" to i32
  %"whilecond" = icmp ne i32 %".13", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".15" = bitcast [3 x i8]* @"str" to i8*
  %"arr.1" = load i32*, i32** %"arr"
  %".16" = load i32*, i32** %"arr"
  %"ptr_incdec" = getelementptr i32, i32* %".16", i32 1
  store i32* %"ptr_incdec", i32** %"arr"
  %"deref_load" = load i32, i32* %".16"
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %"deref_load")
  %"i.3" = load i32, i32* %"i"
  %".19" = load i32, i32* %"i"
  %".20" = add i32 %".19", 1
  store i32 %".20", i32* %"i"
  br label %"while.cond"
while.end:
  ret void
}

@"str" = internal constant [3 x i8] c"%d\00"
define i32 @"main"()
{
entry:
  %"array" = alloca [12 x i32]
  ;  Source: intarray[12]={1,2,3,4,5,6,7,8,9,10,11,12};
  %".3" = getelementptr [12 x i32], [12 x i32]* %"array", i32 0, i32 0
  store i32 1, i32* %".3"
  %".5" = getelementptr [12 x i32], [12 x i32]* %"array", i32 0, i32 1
  store i32 2, i32* %".5"
  %".7" = getelementptr [12 x i32], [12 x i32]* %"array", i32 0, i32 2
  store i32 3, i32* %".7"
  %".9" = getelementptr [12 x i32], [12 x i32]* %"array", i32 0, i32 3
  store i32 4, i32* %".9"
  %".11" = getelementptr [12 x i32], [12 x i32]* %"array", i32 0, i32 4
  store i32 5, i32* %".11"
  %".13" = getelementptr [12 x i32], [12 x i32]* %"array", i32 0, i32 5
  store i32 6, i32* %".13"
  %".15" = getelementptr [12 x i32], [12 x i32]* %"array", i32 0, i32 6
  store i32 7, i32* %".15"
  %".17" = getelementptr [12 x i32], [12 x i32]* %"array", i32 0, i32 7
  store i32 8, i32* %".17"
  %".19" = getelementptr [12 x i32], [12 x i32]* %"array", i32 0, i32 8
  store i32 9, i32* %".19"
  %".21" = getelementptr [12 x i32], [12 x i32]* %"array", i32 0, i32 9
  store i32 10, i32* %".21"
  %".23" = getelementptr [12 x i32], [12 x i32]* %"array", i32 0, i32 10
  store i32 11, i32* %".23"
  %".25" = getelementptr [12 x i32], [12 x i32]* %"array", i32 0, i32 11
  store i32 12, i32* %".25"
  ;  Source: array
  ;  Source: printArr(array,12);
  %".29" = bitcast [12 x i32]* %"array" to i32*
  call void @"printArr"(i32* %".29", i32 12)
  ;  Source: return0;
  ret i32 0
}
