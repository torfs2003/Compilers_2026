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
  %"c" = alloca i32
  store i32 0, i32* %"c"
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: a=0;
  store i32 0, i32* %"a"
  %"a.2" = load i32, i32* %"a"
  switch i32 %"a.2", label %"switch.default" [i32 0, label %"switch.case0" i32 1, label %"switch.case1" i32 6, label %"switch.case6" i32 2, label %"switch.case2"]
switch.merge:
  %".29" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: printf("%d",4);
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".29", i32 4)
  ;  Source: return0;
  ret i32 0
switch.case0:
  br label %"switch.case1"
switch.case1:
  %"b.1" = load i32, i32* %"b"
  store i32 1, i32* %"b"
  %".11" = bitcast [3 x i8]* @"str" to i8*
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 1)
  br label %"while.cond"
switch.case6:
  %"b.2" = load i32, i32* %"b"
  store i32 6, i32* %"b"
  %".18" = bitcast [3 x i8]* @"str.1" to i8*
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 6)
  br label %"switch.merge"
switch.case2:
  %"b.3" = load i32, i32* %"b"
  store i32 2, i32* %"b"
  %".22" = bitcast [3 x i8]* @"str.2" to i8*
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 2)
  br label %"switch.merge"
switch.default:
  %"b.4" = load i32, i32* %"b"
  store i32 3, i32* %"b"
  %".26" = bitcast [3 x i8]* @"str.3" to i8*
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 3)
  br label %"switch.merge"
while.cond:
  %"whilecond" = icmp ne i32 1, 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  br label %"while.end"
while.end:
  br label %"switch.case6"
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"