; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define void @"printPyramid"(i32 %".1", i8 %".2")
{
entry:
  %"rows" = alloca i32
  store i32 %".1", i32* %"rows"
  %"toPrint" = alloca i8
  store i8 %".2", i8* %"toPrint"
  %"i" = alloca i32
  store i32 1, i32* %"i"
  ;  Source: while(i<=rows){intj=1;while(j<i){printf("%c",toPrint);j++;}printf("%c\n",toPrint);i++;}
  br label %"while.cond"
while.cond:
  %"i_load" = load i32, i32* %"i"
  %"rows_load" = load i32, i32* %"rows"
  %".9" = icmp sle i32 %"i_load", %"rows_load"
  %".10" = zext i1 %".9" to i32
  %"whilecond" = icmp ne i32 %".10", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"j" = alloca i32
  store i32 1, i32* %"j"
  br label %"while.cond.1"
while.end:
  ret void
while.cond.1:
  %"j_load" = load i32, i32* %"j"
  %"i_load.1" = load i32, i32* %"i"
  %".14" = icmp slt i32 %"j_load", %"i_load.1"
  %".15" = zext i1 %".14" to i32
  %"whilecond.1" = icmp ne i32 %".15", 0
  br i1 %"whilecond.1", label %"while.body.1", label %"while.end.1"
while.body.1:
  %".17" = bitcast [3 x i8]* @"str" to i8*
  %"toPrint_load" = load i8, i8* %"toPrint"
  %".18" = sext i8 %"toPrint_load" to i32
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".17", i32 %".18")
  %"j_load.1" = load i32, i32* %"j"
  %".20" = load i32, i32* %"j"
  %".21" = add i32 %".20", 1
  store i32 %".21", i32* %"j"
  br label %"while.cond.1"
while.end.1:
  %".24" = bitcast [4 x i8]* @"str.1" to i8*
  %"toPrint_load.1" = load i8, i8* %"toPrint"
  %".25" = sext i8 %"toPrint_load.1" to i32
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 %".25")
  %"i_load.2" = load i32, i32* %"i"
  %".27" = load i32, i32* %"i"
  %".28" = add i32 %".27", 1
  store i32 %".28", i32* %"i"
  br label %"while.cond"
}

define i32 @"main"()
{
entry:
  %"toPrint" = alloca i8
  store i8 42, i8* %"toPrint"
  %"rows" = alloca i32
  store i32 5, i32* %"rows"
  ;  Source: rows
  %"rows_load" = load i32, i32* %"rows"
  ;  Source: toPrint
  %"toPrint_load" = load i8, i8* %"toPrint"
  ;  Source: printPyramid(rows,toPrint);
  call void @"printPyramid"(i32 %"rows_load", i8 %"toPrint_load")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [4 x i8] c"%c\0a\00"