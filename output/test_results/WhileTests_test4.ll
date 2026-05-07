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
  %"b" = alloca i32
  ;  Source: intb=0;
  store i32 0, i32* %"b"
  ;  Source: while(a<30){if((a%2)==0){printf("%d",1);}else{printf("%d",2);while(b<5){printf("%d",b);b++;}}a++;}
  br label %"while.cond"
while.cond:
  %"a.1" = load i32, i32* %"a"
  %".8" = icmp slt i32 %"a.1", 30
  %".9" = zext i1 %".8" to i32
  %"whilecond" = icmp ne i32 %".9", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"a.2" = load i32, i32* %"a"
  %".11" = srem i32 %"a.2", 2
  %".12" = icmp eq i32 %".11", 0
  %".13" = zext i1 %".12" to i32
  %"ifcond" = icmp ne i32 %".13", 0
  br i1 %"ifcond", label %"if.then", label %"if.else"
while.end:
  ;  Source: return0;
  ret i32 0
if.then:
  %".15" = bitcast [3 x i8]* @"str" to i8*
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 1)
  br label %"if.end"
if.end:
  %"a.3" = load i32, i32* %"a"
  %".31" = load i32, i32* %"a"
  %".32" = add i32 %".31", 1
  store i32 %".32", i32* %"a"
  br label %"while.cond"
if.else:
  %".18" = bitcast [3 x i8]* @"str.1" to i8*
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 2)
  br label %"while.cond.1"
while.cond.1:
  %"b.1" = load i32, i32* %"b"
  %".21" = icmp slt i32 %"b.1", 5
  %".22" = zext i1 %".21" to i32
  %"whilecond.1" = icmp ne i32 %".22", 0
  br i1 %"whilecond.1", label %"while.body.1", label %"while.end.1"
while.body.1:
  %".24" = bitcast [3 x i8]* @"str.2" to i8*
  %"b.2" = load i32, i32* %"b"
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 %"b.2")
  %"b.3" = load i32, i32* %"b"
  %".26" = load i32, i32* %"b"
  %".27" = add i32 %".26", 1
  store i32 %".27", i32* %"b"
  br label %"while.cond.1"
while.end.1:
  br label %"if.end"
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"