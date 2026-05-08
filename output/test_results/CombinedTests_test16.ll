; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define void @"upAndDown"(i32 %".1")
{
entry:
  %"upTo" = alloca i32
  store i32 %".1", i32* %"upTo"
  %"to" = alloca i32
  %"upTo_load" = load i32, i32* %"upTo"
  store i32 %"upTo_load", i32* %"to"
  %"i" = alloca i32
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i_load" = load i32, i32* %"i"
  %"upTo_load.1" = load i32, i32* %"upTo"
  %".7" = icmp sle i32 %"i_load", %"upTo_load.1"
  %".8" = zext i1 %".7" to i32
  %"whilecond" = icmp ne i32 %".8", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".10" = bitcast [4 x i8]* @"str" to i8*
  %"i_load.1" = load i32, i32* %"i"
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %"i_load.1")
  %"i_load.2" = load i32, i32* %"i"
  %".12" = load i32, i32* %"i"
  %".13" = add i32 %".12", 1
  store i32 %".13", i32* %"i"
  br label %"while.cond"
while.end:
  %"i.1" = alloca i32
  %"to_load" = load i32, i32* %"to"
  %".16" = sub i32 %"to_load", 1
  store i32 %".16", i32* %"i.1"
  br label %"while.cond.1"
while.cond.1:
  %"i_load.3" = load i32, i32* %"i.1"
  %".19" = icmp sge i32 %"i_load.3", 0
  %".20" = zext i1 %".19" to i32
  %"whilecond.1" = icmp ne i32 %".20", 0
  br i1 %"whilecond.1", label %"while.body.1", label %"while.end.1"
while.body.1:
  %".22" = bitcast [4 x i8]* @"str.1" to i8*
  %"i_load.4" = load i32, i32* %"i.1"
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %"i_load.4")
  %"i_load.5" = load i32, i32* %"i.1"
  %".24" = load i32, i32* %"i.1"
  %".25" = sub i32 %".24", 1
  store i32 %".25", i32* %"i.1"
  br label %"while.cond.1"
while.end.1:
  ret void
}

define i32 @"main"()
{
entry:
  %"upTo" = alloca i32
  store i32 16, i32* %"upTo"
  ;  Source: upTo
  %"upTo_load" = load i32, i32* %"upTo"
  ;  Source: upAndDown(upTo);
  call void @"upAndDown"(i32 %"upTo_load")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"
@"str.1" = internal constant [4 x i8] c"%d\0a\00"