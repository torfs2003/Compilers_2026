; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define void @"printPyramid"(i32 %".1", i8 %".2")
{
entry:
  %"rows" = alloca i32
  store i32 %".1", i32* %"rows"
  %"toPrint" = alloca i8
  store i8 %".2", i8* %"toPrint"
  %"i" = alloca i32
  ;  Source: inti=1;
  store i32 1, i32* %"i"
  ;  Source: while(i<=rows){intj=1;while(j<i){printf("%c",toPrint);j++;}printf("%c\n",toPrint);i++;}
  br label %"while.cond"
while.cond:
  %"i.1" = load i32, i32* %"i"
  %"rows.1" = load i32, i32* %"rows"
  %".10" = icmp sle i32 %"i.1", %"rows.1"
  %".11" = zext i1 %".10" to i32
  %"whilecond" = icmp ne i32 %".11", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"j" = alloca i32
  store i32 1, i32* %"j"
  br label %"while.cond.1"
while.end:
  ret void
while.cond.1:
  %"j.1" = load i32, i32* %"j"
  %"i.2" = load i32, i32* %"i"
  %".15" = icmp slt i32 %"j.1", %"i.2"
  %".16" = zext i1 %".15" to i32
  %"whilecond.1" = icmp ne i32 %".16", 0
  br i1 %"whilecond.1", label %"while.body.1", label %"while.end.1"
while.body.1:
  %".18" = bitcast [3 x i8]* @"str" to i8*
  %"toPrint.1" = load i8, i8* %"toPrint"
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18", i8 %"toPrint.1")
  %"j.2" = load i32, i32* %"j"
  %".20" = load i32, i32* %"j"
  %".21" = add i32 %".20", 1
  store i32 %".21", i32* %"j"
  br label %"while.cond.1"
while.end.1:
  %".24" = bitcast [4 x i8]* @"str.1" to i8*
  %"toPrint.2" = load i8, i8* %"toPrint"
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".24", i8 %"toPrint.2")
  %"i.3" = load i32, i32* %"i"
  %".26" = load i32, i32* %"i"
  %".27" = add i32 %".26", 1
  store i32 %".27", i32* %"i"
  br label %"while.cond"
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [4 x i8] c"%c\0a\00"
define i32 @"main"()
{
entry:
  %"toPrint" = alloca i8
  ;  Source: chartoPrint='*';
  store i8 42, i8* %"toPrint"
  %"rows" = alloca i32
  ;  Source: introws=5;
  store i32 5, i32* %"rows"
  ;  Source: rows
  %"rows.1" = load i32, i32* %"rows"
  ;  Source: toPrint
  %"toPrint.1" = load i8, i8* %"toPrint"
  ;  Source: printPyramid(rows,toPrint);
  call void @"printPyramid"(i32 %"rows.1", i8 %"toPrint.1")
  ;  Source: return0;
  ret i32 0
}
