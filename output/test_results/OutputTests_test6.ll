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
  %"x" = alloca i8
  store i8 120, i8* %"x"
  %".3" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  %"x_load" = load i8, i8* %"x"
  ;  Source: printf("%c",x);
  %".6" = sext i8 %"x_load" to i32
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %".6")
  %"dot" = alloca i8
  store i8 46, i8* %"dot"
  %".9" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: dot
  %"dot_load" = load i8, i8* %"dot"
  ;  Source: printf("%c",dot);
  %".12" = sext i8 %"dot_load" to i32
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %".12")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%c\00"