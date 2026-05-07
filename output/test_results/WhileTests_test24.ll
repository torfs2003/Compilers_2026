; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 0, i32* %"a"
  %"i" = alloca i32
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: i=0
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.2" = load i32, i32* %"i"
  %".7" = icmp slt i32 %"i.2", 5
  %".8" = zext i1 %".7" to i32
  %"whilecond" = icmp ne i32 %".8", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"b" = alloca i32
  %"i.3" = load i32, i32* %"i"
  store i32 %"i.3", i32* %"b"
  %".11" = bitcast [3 x i8]* @"str" to i8*
  %"b.1" = load i32, i32* %"b"
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %"b.1")
  %"i.4" = load i32, i32* %"i"
  %".13" = load i32, i32* %"i"
  %".14" = add i32 %".13", 1
  store i32 %".14", i32* %"i"
  br label %"while.cond"
while.end:
  ;  Source: while(a<2){a++;printf("a %d a\t",a);continue;}
  br label %"while.cond.1"
while.cond.1:
  %"a.1" = load i32, i32* %"a"
  %".19" = icmp slt i32 %"a.1", 2
  %".20" = zext i1 %".19" to i32
  %"whilecond.1" = icmp ne i32 %".20", 0
  br i1 %"whilecond.1", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"a.2" = load i32, i32* %"a"
  %".22" = load i32, i32* %"a"
  %".23" = add i32 %".22", 1
  store i32 %".23", i32* %"a"
  %".25" = bitcast [8 x i8]* @"str.1" to i8*
  %"a.3" = load i32, i32* %"a"
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 %"a.3")
  br label %"while.cond.1"
while.end.1:
  ;  Source: while(1){break;}
  br label %"while.cond.2"
while.cond.2:
  %"whilecond.2" = icmp ne i32 1, 0
  br i1 %"whilecond.2", label %"while.body.2", label %"while.end.2"
while.body.2:
  br label %"while.end.2"
while.end.2:
  %".32" = bitcast [7 x i8]* @"str.2" to i8*
  ;  Source: printf("b %d b",5);
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 5)
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [8 x i8] c"a %d a\09\00"
@"str.2" = internal constant [7 x i8] c"b %d b\00"