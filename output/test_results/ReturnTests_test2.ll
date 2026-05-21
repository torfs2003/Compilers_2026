; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i8 @"d"()
{
entry:
  ;  Source: return98;
  %".3" = trunc i32 98 to i8
  ret i8 %".3"
}

define i32 @"main"()
{
entry:
  %"a" = alloca i8
  store i8 113, i8* %"a"
  ;  Source: a
  %"a_load" = load i8, i8* %"a"
  ;  Source: d()
  %".5" = call i8 @"d"()
  ;  Source: a=d();
  store i8 %".5", i8* %"a"
  %".8" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a_load.1" = load i8, i8* %"a"
  ;  Source: printf("%c",a);
  %".11" = sext i8 %"a_load.1" to i32
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %".11")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"