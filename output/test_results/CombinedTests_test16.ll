; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
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

define void @"upAndDown"(i32 %".1")
{
entry:
  %"upTo" = alloca i32
  store i32 %".1", i32* %"upTo"
  %"to" = alloca i32
  ;  Source: upTo
  %"upTo.1" = load i32, i32* %"upTo"
  ;  Source: intto=upTo;
  store i32 %"upTo.1", i32* %"to"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.1" = load i32, i32* %"i"
  %"upTo.2" = load i32, i32* %"upTo"
  %".9" = icmp sle i32 %"i.1", %"upTo.2"
  %".10" = zext i1 %".9" to i32
  %"whilecond" = icmp ne i32 %".10", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".12" = bitcast [4 x i8]* @"str" to i8*
  %"i.2" = load i32, i32* %"i"
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"i.2")
  %"i.3" = load i32, i32* %"i"
  %".14" = load i32, i32* %"i"
  %".15" = add i32 %".14", 1
  store i32 %".15", i32* %"i"
  br label %"while.cond"
while.end:
  ;  Source: to
  %"to.1" = load i32, i32* %"to"
  ;  Source: to-1
  %".20" = sub i32 %"to.1", 1
  store i32 %".20", i32* %"i"
  br label %"while.cond.1"
while.cond.1:
  %"i.4" = load i32, i32* %"i"
  %".23" = icmp sge i32 %"i.4", 0
  %".24" = zext i1 %".23" to i32
  %"whilecond.1" = icmp ne i32 %".24", 0
  br i1 %"whilecond.1", label %"while.body.1", label %"while.end.1"
while.body.1:
  %".26" = bitcast [4 x i8]* @"str.1" to i8*
  %"i.5" = load i32, i32* %"i"
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 %"i.5")
  %"i.6" = load i32, i32* %"i"
  %".28" = load i32, i32* %"i"
  %".29" = sub i32 %".28", 1
  store i32 %".29", i32* %"i"
  br label %"while.cond.1"
while.end.1:
  ret void
}

define i32 @"main"()
{
entry:
  %"upTo" = alloca i32
  ;  Source: intupTo=16;
  store i32 16, i32* %"upTo"
  ;  Source: upTo
  %"upTo.1" = load i32, i32* %"upTo"
  ;  Source: upAndDown(upTo);
  call void @"upAndDown"(i32 %"upTo.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"
@"str.1" = internal constant [4 x i8] c"%d\0a\00"