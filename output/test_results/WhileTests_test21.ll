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

define i32 @"main"()
{
entry:
  %"i" = alloca i32
  ;  Source: inti=0;
  store i32 0, i32* %"i"
  ;  Source: while(10==10){printf("%d",i);i++;break;}
  br label %"while.cond"
while.cond:
  %"whilecond" = icmp ne i32 1, 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %".7" = bitcast [3 x i8]* @"str" to i8*
  %"i.1" = load i32, i32* %"i"
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %"i.1")
  %"i.2" = load i32, i32* %"i"
  %".9" = load i32, i32* %"i"
  %".10" = add i32 %".9", 1
  store i32 %".10", i32* %"i"
  br label %"while.end"
while.end:
  %"j" = alloca i32
  ;  Source: intj;
  ;  Source: j
  %"j.1" = load i32, i32* %"j"
  ;  Source: j=0
  store i32 0, i32* %"j"
  br label %"while.cond.1"
while.cond.1:
  %"j.2" = load i32, i32* %"j"
  %".18" = icmp slt i32 %"j.2", 10
  %".19" = zext i1 %".18" to i32
  %"whilecond.1" = icmp ne i32 %".19", 0
  br i1 %"whilecond.1", label %"while.body.1", label %"while.end.1"
while.body.1:
  %".21" = bitcast [3 x i8]* @"str.1" to i8*
  %"j.3" = load i32, i32* %"j"
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %"j.3")
  %"j.4" = load i32, i32* %"j"
  %".23" = load i32, i32* %"j"
  %".24" = add i32 %".23", 1
  store i32 %".24", i32* %"j"
  br label %"while.cond.1"
while.end.1:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"