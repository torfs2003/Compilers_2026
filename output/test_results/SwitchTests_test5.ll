; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 0, i32* %"a"
  %"b" = alloca i32
  store i32 0, i32* %"b"
  ;  Source: a
  %"a_load" = load i32, i32* %"a"
  ;  Source: a=2;
  store i32 2, i32* %"a"
  %"a_load.1" = load i32, i32* %"a"
  switch i32 %"a_load.1", label %"switch.default" [i32 1, label %"switch.case1" i32 6, label %"switch.case6"]
switch.merge:
  %".26" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: printf("%d",4);
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 4)
  ;  Source: return0;
  ret i32 0
switch.case1:
  %"a_load.2" = load i32, i32* %"a"
  %".8" = icmp sgt i32 %"a_load.2", 1
  %".9" = zext i1 %".8" to i32
  %"ifcond" = icmp ne i32 %".9", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
switch.case6:
  %"a_load.3" = load i32, i32* %"a"
  %".14" = icmp sgt i32 %"a_load.3", 3
  %".15" = zext i1 %".14" to i32
  %"ifcond.1" = icmp ne i32 %".15", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.end.1"
switch.default:
  %"a_load.4" = load i32, i32* %"a"
  %".20" = icmp sle i32 %"a_load.4", 9
  %".21" = zext i1 %".20" to i32
  %"ifcond.2" = icmp ne i32 %".21", 0
  br i1 %"ifcond.2", label %"if.then.2", label %"if.end.2"
if.then:
  %"c" = alloca i32
  store i32 0, i32* %"c"
  br label %"if.end"
if.end:
  br label %"switch.merge"
if.then.1:
  %"d" = alloca i32
  store i32 0, i32* %"d"
  br label %"if.end.1"
if.end.1:
  br label %"switch.merge"
if.then.2:
  %"e" = alloca i32
  store i32 0, i32* %"e"
  br label %"if.end.2"
if.end.2:
  br label %"switch.merge"
}

@"str" = internal constant [3 x i8] c"%d\00"