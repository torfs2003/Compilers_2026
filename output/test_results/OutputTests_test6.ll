; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"x" = alloca i8
  ;  Source: charx='x';
  store i8 120, i8* %"x"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  %"x.1" = load i8, i8* %"x"
  ;  Source: printf("%c",x);
  %".7" = zext i8 %"x.1" to i32
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %".7")
  %"dot" = alloca i8
  ;  Source: chardot='.';
  store i8 46, i8* %"dot"
  %".11" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: dot
  %"dot.1" = load i8, i8* %"dot"
  ;  Source: printf("%c",dot);
  %".14" = zext i8 %"dot.1" to i32
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %".14")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%c\00"