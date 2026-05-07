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
  store i32 1, i32* %"b"
  %".3" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: b++
  %".6" = load i32, i32* %"b"
  %".7" = add i32 %".6", 1
  store i32 %".7", i32* %"b"
  ;  Source: printf("%d",b++);
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %".6")
  %".11" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  ;  Source: printf("%d",b);
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %"b.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"