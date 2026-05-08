; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"a"(i32 %".1")
{
entry:
  %"b" = alloca i32
  store i32 %".1", i32* %"b"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: b
  %"b_load" = load i32, i32* %"b"
  ;  Source: printf("%d",b);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"b_load")
  ;  Source: return0;
  ret i32 0
}

define i32 @"main"()
{
entry:
  %"c" = alloca i32
  store i32 2, i32* %"c"
  ;  Source: c
  %"c_load" = load i32, i32* %"c"
  ;  Source: a(c);
  %".5" = call i32 @"a"(i32 %"c_load")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"