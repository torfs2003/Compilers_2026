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

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: inta=0;
  store i32 0, i32* %"a"
  %"i" = alloca i32
  ;  Source: inti;
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: i=0
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.2" = load i32, i32* %"i"
  %".9" = icmp slt i32 %"i.2", 5
  %".10" = zext i1 %".9" to i32
  %"whilecond" = icmp ne i32 %".10", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"b" = alloca i32
  %"i.3" = load i32, i32* %"i"
  store i32 %"i.3", i32* %"b"
  %".13" = bitcast [3 x i8]* @"str" to i8*
  %"b.1" = load i32, i32* %"b"
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %"b.1")
  %"i.4" = load i32, i32* %"i"
  %".15" = load i32, i32* %"i"
  %".16" = add i32 %".15", 1
  store i32 %".16", i32* %"i"
  br label %"while.cond"
while.end:
  ;  Source: while(a<2){a++;printf("a %d a\t",a);continue;}
  br label %"while.cond.1"
while.cond.1:
  %"a.1" = load i32, i32* %"a"
  %".21" = icmp slt i32 %"a.1", 2
  %".22" = zext i1 %".21" to i32
  %"whilecond.1" = icmp ne i32 %".22", 0
  br i1 %"whilecond.1", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"a.2" = load i32, i32* %"a"
  %".24" = load i32, i32* %"a"
  %".25" = add i32 %".24", 1
  store i32 %".25", i32* %"a"
  %".27" = bitcast [8 x i8]* @"str.1" to i8*
  %"a.3" = load i32, i32* %"a"
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 %"a.3")
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
  %".34" = bitcast [7 x i8]* @"str.2" to i8*
  ;  Source: printf("b %d b",5);
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".34", i32 5)
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [8 x i8] c"a %d a\09\00"
@"str.2" = internal constant [7 x i8] c"b %d b\00"