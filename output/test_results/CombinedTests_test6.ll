; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define void @"swap"(i32* %".1", i32* %".2")
{
entry:
  %"xp" = alloca i32*
  store i32* %".1", i32** %"xp"
  %"yp" = alloca i32*
  store i32* %".2", i32** %"yp"
  %"temp" = alloca i32
  %"xp_load" = load i32*, i32** %"xp"
  %"deref_load" = load i32, i32* %"xp_load"
  store i32 %"deref_load", i32* %"temp"
  ;  Source: xp
  %"xp_load.1" = load i32*, i32** %"xp"
  %"deref_load.1" = load i32, i32* %"xp_load.1"
  ;  Source: yp
  %"yp_load" = load i32*, i32** %"yp"
  ;  Source: *yp
  %"deref_load.2" = load i32, i32* %"yp_load"
  ;  Source: *xp=*yp;
  store i32 %"deref_load.2", i32* %"xp_load.1"
  ;  Source: yp
  %"yp_load.1" = load i32*, i32** %"yp"
  %"deref_load.3" = load i32, i32* %"yp_load.1"
  ;  Source: temp
  %"temp_load" = load i32, i32* %"temp"
  ;  Source: *yp=temp;
  store i32 %"temp_load", i32* %"yp_load.1"
  ret void
}

define void @"selectionSort"(i32* %".1", i32 %".2")
{
entry:
  %"arr" = alloca i32*
  store i32* %".1", i32** %"arr"
  %"n" = alloca i32
  store i32 %".2", i32* %"n"
  %"i" = alloca i32
  %"j" = alloca i32
  %"min_idx" = alloca i32
  ;  Source: i
  %"i_load" = load i32, i32* %"i"
  ;  Source: i=0
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i_load.1" = load i32, i32* %"i"
  %"n_load" = load i32, i32* %"n"
  %".10" = sub i32 %"n_load", 1
  %".11" = icmp slt i32 %"i_load.1", %".10"
  %".12" = zext i1 %".11" to i32
  %"whilecond" = icmp ne i32 %".12", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"i_load.2" = load i32, i32* %"i"
  %"min_idx_load" = load i32, i32* %"min_idx"
  store i32 %"i_load.2", i32* %"min_idx"
  %"i_load.3" = load i32, i32* %"i"
  %".15" = add i32 %"i_load.3", 1
  %"j_load" = load i32, i32* %"j"
  store i32 %".15", i32* %"j"
  br label %"while.cond.1"
while.end:
  ret void
while.cond.1:
  %"j_load.1" = load i32, i32* %"j"
  %"n_load.1" = load i32, i32* %"n"
  %".18" = icmp slt i32 %"j_load.1", %"n_load.1"
  %".19" = zext i1 %".18" to i32
  %"whilecond.1" = icmp ne i32 %".19", 0
  br i1 %"whilecond.1", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"arr_load" = load i32*, i32** %"arr"
  %"j_load.2" = load i32, i32* %"j"
  %"gep_ptr" = getelementptr i32, i32* %"arr_load", i32 %"j_load.2"
  %"array_element" = load i32, i32* %"gep_ptr"
  %"arr_load.1" = load i32*, i32** %"arr"
  %"min_idx_load.1" = load i32, i32* %"min_idx"
  %"gep_ptr.1" = getelementptr i32, i32* %"arr_load.1", i32 %"min_idx_load.1"
  %"array_element.1" = load i32, i32* %"gep_ptr.1"
  %".21" = icmp slt i32 %"array_element", %"array_element.1"
  %".22" = zext i1 %".21" to i32
  %"ifcond" = icmp ne i32 %".22", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
while.end.1:
  %"arr_load.2" = load i32*, i32** %"arr"
  %"min_idx_load.3" = load i32, i32* %"min_idx"
  %"gep_ptr.2" = getelementptr i32, i32* %"arr_load.2", i32 %"min_idx_load.3"
  %"array_element.2" = load i32, i32* %"gep_ptr.2"
  %"arr_load.3" = load i32*, i32** %"arr"
  %"i_load.4" = load i32, i32* %"i"
  %"gep_ptr.3" = getelementptr i32, i32* %"arr_load.3", i32 %"i_load.4"
  %"array_element.3" = load i32, i32* %"gep_ptr.3"
  call void @"swap"(i32* %"gep_ptr.2", i32* %"gep_ptr.3")
  %"i_load.5" = load i32, i32* %"i"
  %".31" = load i32, i32* %"i"
  %".32" = add i32 %".31", 1
  store i32 %".32", i32* %"i"
  br label %"while.cond"
if.then:
  %"j_load.3" = load i32, i32* %"j"
  %"min_idx_load.2" = load i32, i32* %"min_idx"
  store i32 %"j_load.3", i32* %"min_idx"
  br label %"if.end"
if.end:
  %"j_load.4" = load i32, i32* %"j"
  %".26" = load i32, i32* %"j"
  %".27" = add i32 %".26", 1
  store i32 %".27", i32* %"j"
  br label %"while.cond.1"
}

define void @"printArray"(i32* %".1", i32 %".2")
{
entry:
  %"arr" = alloca i32*
  store i32* %".1", i32** %"arr"
  %"size" = alloca i32
  store i32 %".2", i32* %"size"
  %"i" = alloca i32
  ;  Source: i
  %"i_load" = load i32, i32* %"i"
  ;  Source: i=0
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i_load.1" = load i32, i32* %"i"
  %"size_load" = load i32, i32* %"size"
  %".10" = icmp slt i32 %"i_load.1", %"size_load"
  %".11" = zext i1 %".10" to i32
  %"whilecond" = icmp ne i32 %".11", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".13" = bitcast [4 x i8]* @"str" to i8*
  %"arr_load" = load i32*, i32** %"arr"
  %"i_load.2" = load i32, i32* %"i"
  %"gep_ptr" = getelementptr i32, i32* %"arr_load", i32 %"i_load.2"
  %"array_element" = load i32, i32* %"gep_ptr"
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %"array_element")
  %"i_load.3" = load i32, i32* %"i"
  %".15" = load i32, i32* %"i"
  %".16" = add i32 %".15", 1
  store i32 %".16", i32* %"i"
  br label %"while.cond"
while.end:
  %".19" = bitcast [2 x i8]* @"str.1" to i8*
  ;  Source: printf("\n");
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".19")
  ret void
}

define i32 @"main"()
{
entry:
  %"arr" = alloca [5 x i32]
  store [5 x i32] zeroinitializer, [5 x i32]* %"arr"
  %".3" = getelementptr [5 x i32], [5 x i32]* %"arr", i32 0, i32 0
  store i32 0, i32* %".3"
  %".5" = getelementptr [5 x i32], [5 x i32]* %"arr", i32 0, i32 1
  store i32 23, i32* %".5"
  %".7" = getelementptr [5 x i32], [5 x i32]* %"arr", i32 0, i32 2
  store i32 14, i32* %".7"
  %".9" = getelementptr [5 x i32], [5 x i32]* %"arr", i32 0, i32 3
  store i32 12, i32* %".9"
  %".11" = getelementptr [5 x i32], [5 x i32]* %"arr", i32 0, i32 4
  store i32 9, i32* %".11"
  %"n" = alloca i32
  store i32 5, i32* %"n"
  ;  Source: arr
  ;  Source: n
  %"n_load" = load i32, i32* %"n"
  ;  Source: printArray(arr,n);
  %".17" = bitcast [5 x i32]* %"arr" to i32*
  call void @"printArray"(i32* %".17", i32 %"n_load")
  ;  Source: arr
  ;  Source: n
  %"n_load.1" = load i32, i32* %"n"
  ;  Source: selectionSort(arr,n);
  %".22" = bitcast [5 x i32]* %"arr" to i32*
  call void @"selectionSort"(i32* %".22", i32 %"n_load.1")
  ;  Source: arr
  ;  Source: n
  %"n_load.2" = load i32, i32* %"n"
  ;  Source: printArray(arr,n);
  %".27" = bitcast [5 x i32]* %"arr" to i32*
  call void @"printArray"(i32* %".27", i32 %"n_load.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d \00"
@"str.1" = internal constant [2 x i8] c"\0a\00"