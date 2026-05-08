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
  store i32 6, i32* %"a"
  ;  Source: a
  %"a_load" = load i32, i32* %"a"
  ;  Source: a=6;
  store i32 6, i32* %"a"
  %"b" = alloca i32
  %"a_load.1" = load i32, i32* %"a"
  store i32 %"a_load.1", i32* %"b"
  %".7" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: b
  %"b_load" = load i32, i32* %"b"
  ;  Source: printf("%d",b);
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %"b_load")
  ;  Source: b
  %"b_load.1" = load i32, i32* %"b"
  ;  Source: a
  %"a_load.2" = load i32, i32* %"a"
  ;  Source: -a
  %".14" = sub i32 0, %"a_load.2"
  ;  Source: b=-a;
  store i32 %".14", i32* %"b"
  %".17" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: b
  %"b_load.2" = load i32, i32* %"b"
  ;  Source: printf("%d",b);
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".17", i32 %"b_load.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"