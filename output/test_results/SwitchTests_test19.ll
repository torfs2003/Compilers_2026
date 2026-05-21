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
  %"b" = alloca i32
  %"a" = alloca i32
  store i32 1, i32* %"a"
  %"a_load" = load i32, i32* %"a"
  switch i32 %"a_load", label %"switch.default" [i32 1, label %"switch.case1"]
switch.merge:
  %".8" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: b
  %"b_load.2" = load i32, i32* %"b"
  ;  Source: printf("%d",b);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"b_load.2")
  ;  Source: return0;
  ret i32 0
switch.case1:
  %"b_load" = load i32, i32* %"b"
  store i32 1, i32* %"b"
  br label %"switch.merge"
switch.default:
  %"b_load.1" = load i32, i32* %"b"
  store i32 3, i32* %"b"
  br label %"switch.merge"
}

@"str" = internal constant [3 x i8] c"%d\00"