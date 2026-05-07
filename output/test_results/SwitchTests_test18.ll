; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 9, i32* %"a"
  %"b" = alloca i32
  %"a.1" = load i32, i32* %"a"
  switch i32 %"a.1", label %"switch.default" [i32 1, label %"switch.case1" i32 6, label %"switch.case6" i32 7, label %"switch.case7"]
switch.merge:
  %".19" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: printf("%d",4);
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 4)
  ;  Source: return0;
  ret i32 0
switch.case1:
  %"b.1" = load i32, i32* %"b"
  store i32 1, i32* %"b"
  %".5" = bitcast [3 x i8]* @"str" to i8*
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 1)
  br label %"switch.merge"
switch.case6:
  %".8" = bitcast [3 x i8]* @"str.1" to i8*
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 6)
  br label %"switch.merge"
switch.default:
  %"b.2" = load i32, i32* %"b"
  store i32 3, i32* %"b"
  %".12" = bitcast [3 x i8]* @"str.2" to i8*
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 3)
  br label %"switch.case7"
switch.case7:
  store i32 7, i32* %"b"
  %".16" = bitcast [3 x i8]* @"str.3" to i8*
  %"b.3" = load i32, i32* %"b"
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 %"b.3")
  br label %"switch.merge"
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"