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
  %".13" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: printf("%d",4);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 4)
  ;  Source: return0;
  ret i32 0
switch.case1:
  br label %"switch.merge"
switch.case6:
  %"d" = alloca i32
  store i32 0, i32* %"d"
  br label %"switch.merge"
switch.default:
  %"e" = alloca i32
  store i32 0, i32* %"e"
  br label %"switch.merge"
}

@"str" = internal constant [3 x i8] c"%d\00"