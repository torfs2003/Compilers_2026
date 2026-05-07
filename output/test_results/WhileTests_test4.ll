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
  %"b" = alloca i32
  store i32 0, i32* %"b"
  ;  Source: while(a<30){if((a%2)==0){printf("%d",1);}else{printf("%d",2);while(b<5){printf("%d",b);b++;}}a++;}
  br label %"while.cond"
while.cond:
  %"a.1" = load i32, i32* %"a"
  %".6" = icmp slt i32 %"a.1", 30
  %".7" = zext i1 %".6" to i32
  %"whilecond" = icmp ne i32 %".7", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"a.2" = load i32, i32* %"a"
  %".9" = srem i32 %"a.2", 2
  %".10" = icmp eq i32 %".9", 0
  %".11" = zext i1 %".10" to i32
  %"ifcond" = icmp ne i32 %".11", 0
  br i1 %"ifcond", label %"if.then", label %"if.else"
while.end:
  ;  Source: return0;
  ret i32 0
if.then:
  %".13" = bitcast [3 x i8]* @"str" to i8*
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 1)
  br label %"if.end"
if.end:
  %"a.3" = load i32, i32* %"a"
  %".29" = load i32, i32* %"a"
  %".30" = add i32 %".29", 1
  store i32 %".30", i32* %"a"
  br label %"while.cond"
if.else:
  %".16" = bitcast [3 x i8]* @"str.1" to i8*
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 2)
  br label %"while.cond.1"
while.cond.1:
  %"b.1" = load i32, i32* %"b"
  %".19" = icmp slt i32 %"b.1", 5
  %".20" = zext i1 %".19" to i32
  %"whilecond.1" = icmp ne i32 %".20", 0
  br i1 %"whilecond.1", label %"while.body.1", label %"while.end.1"
while.body.1:
  %".22" = bitcast [3 x i8]* @"str.2" to i8*
  %"b.2" = load i32, i32* %"b"
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %"b.2")
  %"b.3" = load i32, i32* %"b"
  %".24" = load i32, i32* %"b"
  %".25" = add i32 %".24", 1
  store i32 %".25", i32* %"b"
  br label %"while.cond.1"
while.end.1:
  br label %"if.end"
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"