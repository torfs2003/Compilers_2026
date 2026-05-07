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
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  %"a.2" = load i32, i32* %"a"
  switch i32 %"a.2", label %"switch.default" [i32 1, label %"switch.case1" i32 6, label %"switch.case6" i32 2, label %"switch.case2"]
switch.merge:
  %".30" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: printf("%d",4);
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 4)
  ;  Source: return0;
  ret i32 0
switch.case1:
  %"b.1" = load i32, i32* %"b"
  store i32 1, i32* %"b"
  %".9" = bitcast [3 x i8]* @"str" to i8*
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 1)
  %"a.3" = load i32, i32* %"a"
  %".11" = icmp slt i32 %"a.3", 3
  %".12" = zext i1 %".11" to i32
  %"ifcond" = icmp ne i32 %".12", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
switch.case6:
  %"b.2" = load i32, i32* %"b"
  store i32 6, i32* %"b"
  %".19" = bitcast [3 x i8]* @"str.2" to i8*
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 6)
  br label %"switch.default"
switch.default:
  %"b.3" = load i32, i32* %"b"
  store i32 3, i32* %"b"
  %".23" = bitcast [3 x i8]* @"str.3" to i8*
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 3)
  br label %"switch.case2"
switch.case2:
  %"b.4" = load i32, i32* %"b"
  store i32 2, i32* %"b"
  %".27" = bitcast [3 x i8]* @"str.4" to i8*
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 2)
  br label %"switch.merge"
if.then:
  %".14" = bitcast [3 x i8]* @"str.1" to i8*
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 7)
  br label %"if.end"
if.end:
  br label %"switch.case6"
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"
@"str.5" = internal constant [3 x i8] c"%d\00"