; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define void @"swap"(i32* %".1", i32* %".2")
{
entry:
  %"xp" = alloca i32*
  store i32* %".1", i32** %"xp"
  %"yp" = alloca i32*
  store i32* %".2", i32** %"yp"
  %"temp" = alloca i32
  ;  Source: xp
  %"xp.1" = load i32*, i32** %"xp"
  ;  Source: *xp
  %"deref_load" = load i32, i32* %"xp.1"
  ;  Source: inttemp=*xp;
  store i32 %"deref_load", i32* %"temp"
  ;  Source: xp
  %"xp.2" = load i32*, i32** %"xp"
  %"deref_load.1" = load i32, i32* %"xp.2"
  ;  Source: yp
  %"yp.1" = load i32*, i32** %"yp"
  ;  Source: *yp
  %"deref_load.2" = load i32, i32* %"yp.1"
  ;  Source: *xp=*yp;
  store i32 %"deref_load.2", i32* %"xp.2"
  ;  Source: yp
  %"yp.2" = load i32*, i32** %"yp"
  %"deref_load.3" = load i32, i32* %"yp.2"
  ;  Source: temp
  %"temp.1" = load i32, i32* %"temp"
  ;  Source: *yp=temp;
  store i32 %"temp.1", i32* %"yp.2"
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
  ;  Source: inti;
  %"j" = alloca i32
  ;  Source: intj;
  %"min_idx" = alloca i32
  ;  Source: intmin_idx;
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: i=0
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.2" = load i32, i32* %"i"
  %"n.1" = load i32, i32* %"n"
  %".13" = sub i32 %"n.1", 1
  %".14" = icmp slt i32 %"i.2", %".13"
  %".15" = zext i1 %".14" to i32
  %"whilecond" = icmp ne i32 %".15", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"i.3" = load i32, i32* %"i"
  %"min_idx.1" = load i32, i32* %"min_idx"
  store i32 %"i.3", i32* %"min_idx"
  %"i.4" = load i32, i32* %"i"
  %".18" = add i32 %"i.4", 1
  %"j.1" = load i32, i32* %"j"
  store i32 %".18", i32* %"j"
  br label %"while.cond.1"
while.end:
  ret void
while.cond.1:
  %"j.2" = load i32, i32* %"j"
  %"n.2" = load i32, i32* %"n"
  %".21" = icmp slt i32 %"j.2", %"n.2"
  %".22" = zext i1 %".21" to i32
  %"whilecond.1" = icmp ne i32 %".22", 0
  br i1 %"whilecond.1", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"arr.1" = load i32*, i32** %"arr"
  %"j.3" = load i32, i32* %"j"
  %"gep_ptr" = getelementptr i32, i32* %"arr.1", i32 %"j.3"
  %"array_element" = load i32, i32* %"gep_ptr"
  %"arr.2" = load i32*, i32** %"arr"
  %"min_idx.2" = load i32, i32* %"min_idx"
  %"gep_ptr.1" = getelementptr i32, i32* %"arr.2", i32 %"min_idx.2"
  %"array_element.1" = load i32, i32* %"gep_ptr.1"
  %".24" = icmp slt i32 %"array_element", %"array_element.1"
  %".25" = zext i1 %".24" to i32
  %"ifcond" = icmp ne i32 %".25", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
while.end.1:
  %"arr.3" = load i32*, i32** %"arr"
  %"min_idx.4" = load i32, i32* %"min_idx"
  %"gep_ptr.2" = getelementptr i32, i32* %"arr.3", i32 %"min_idx.4"
  %"array_element.2" = load i32, i32* %"gep_ptr.2"
  %"arr.4" = load i32*, i32** %"arr"
  %"i.5" = load i32, i32* %"i"
  %"gep_ptr.3" = getelementptr i32, i32* %"arr.4", i32 %"i.5"
  %"array_element.3" = load i32, i32* %"gep_ptr.3"
  call void @"swap"(i32* %"gep_ptr.2", i32* %"gep_ptr.3")
  %"i.6" = load i32, i32* %"i"
  %".34" = load i32, i32* %"i"
  %".35" = add i32 %".34", 1
  store i32 %".35", i32* %"i"
  br label %"while.cond"
if.then:
  %"j.4" = load i32, i32* %"j"
  %"min_idx.3" = load i32, i32* %"min_idx"
  store i32 %"j.4", i32* %"min_idx"
  br label %"if.end"
if.end:
  %"j.5" = load i32, i32* %"j"
  %".29" = load i32, i32* %"j"
  %".30" = add i32 %".29", 1
  store i32 %".30", i32* %"j"
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
  ;  Source: inti;
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: i=0
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.2" = load i32, i32* %"i"
  %"size.1" = load i32, i32* %"size"
  %".11" = icmp slt i32 %"i.2", %"size.1"
  %".12" = zext i1 %".11" to i32
  %"whilecond" = icmp ne i32 %".12", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".14" = bitcast [4 x i8]* @"str" to i8*
  %"arr.1" = load i32*, i32** %"arr"
  %"i.3" = load i32, i32* %"i"
  %"gep_ptr" = getelementptr i32, i32* %"arr.1", i32 %"i.3"
  %"array_element" = load i32, i32* %"gep_ptr"
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"array_element")
  %"i.4" = load i32, i32* %"i"
  %".16" = load i32, i32* %"i"
  %".17" = add i32 %".16", 1
  store i32 %".17", i32* %"i"
  br label %"while.cond"
while.end:
  %".20" = bitcast [2 x i8]* @"str.1" to i8*
  ;  Source: printf("\n");
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".20")
  ret void
}

@"str" = internal constant [4 x i8] c"%d \00"
@"str.1" = internal constant [2 x i8] c"\0a\00"
define i32 @"main"()
{
entry:
  %"arr" = alloca [5 x i32]
  ;  Source: intarr[5]={0,23,14,12,9};
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
  ;  Source: intn=5;
  store i32 5, i32* %"n"
  ;  Source: arr
  ;  Source: n
  %"n.1" = load i32, i32* %"n"
  ;  Source: printArray(arr,n);
  %".18" = bitcast [5 x i32]* %"arr" to i32*
  call void @"printArray"(i32* %".18", i32 %"n.1")
  ;  Source: arr
  ;  Source: n
  %"n.2" = load i32, i32* %"n"
  ;  Source: selectionSort(arr,n);
  %".23" = bitcast [5 x i32]* %"arr" to i32*
  call void @"selectionSort"(i32* %".23", i32 %"n.2")
  ;  Source: arr
  ;  Source: n
  %"n.3" = load i32, i32* %"n"
  ;  Source: printArray(arr,n);
  %".28" = bitcast [5 x i32]* %"arr" to i32*
  call void @"printArray"(i32* %".28", i32 %"n.3")
  ;  Source: return0;
  ret i32 0
}
