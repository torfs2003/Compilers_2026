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

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"data" = alloca [5 x i32]
  ;  Source: intdata[5]={1,2,3,4,5};
  %".3" = getelementptr [5 x i32], [5 x i32]* %"data", i32 0, i32 0
  store i32 1, i32* %".3"
  %".5" = getelementptr [5 x i32], [5 x i32]* %"data", i32 0, i32 1
  store i32 2, i32* %".5"
  %".7" = getelementptr [5 x i32], [5 x i32]* %"data", i32 0, i32 2
  store i32 3, i32* %".7"
  %".9" = getelementptr [5 x i32], [5 x i32]* %"data", i32 0, i32 3
  store i32 4, i32* %".9"
  %".11" = getelementptr [5 x i32], [5 x i32]* %"data", i32 0, i32 4
  store i32 5, i32* %".11"
  %"ptr" = alloca i32*
  ;  Source: data
  ;  Source: int*ptr=data;
  %".15" = bitcast [5 x i32]* %"data" to i32*
  store i32* %".15", i32** %"ptr"
  %"i" = alloca i32
  ;  Source: inti;
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: i=0
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.2" = load i32, i32* %"i"
  %".22" = icmp slt i32 %"i.2", 4
  %".23" = zext i1 %".22" to i32
  %"whilecond" = icmp ne i32 %".23", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".25" = bitcast [25 x i8]* @"str" to i8*
  %"i.3" = load i32, i32* %"i"
  %"i.4" = load i32, i32* %"i"
  %".26" = add i32 %"i.4", 1
  %"ptr.1" = load i32*, i32** %"ptr"
  %"i.5" = load i32, i32* %"i"
  %".27" = getelementptr i32, i32* %"ptr.1", i32 %"i.5"
  %"ptr.2" = load i32*, i32** %"ptr"
  %"i.6" = load i32, i32* %"i"
  %".28" = getelementptr i32, i32* %"ptr.2", i32 %"i.6"
  %".29" = getelementptr i32, i32* %".28", i32 1
  %".30" = ptrtoint i32* %".27" to i32
  %".31" = ptrtoint i32* %".29" to i32
  %".32" = icmp ult i32 %".30", %".31"
  %".33" = zext i1 %".32" to i32
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 %"i.3", i32 %".26", i32 %".33")
  %"i.7" = load i32, i32* %"i"
  %".35" = load i32, i32* %"i"
  %".36" = add i32 %".35", 1
  store i32 %".36", i32* %"i"
  br label %"while.cond"
while.end:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [25 x i8] c"ptr + %d < ptr + %d: %d\0a\00"