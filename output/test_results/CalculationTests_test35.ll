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
  %"a" = alloca i8
  %".2" = trunc i32 10 to i8
  store i8 %".2", i8* %"a"
  %"b" = alloca i8
  %".4" = trunc i32 245 to i8
  store i8 %".4", i8* %"b"
  %".6" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a_load" = load i8, i8* %"a"
  ;  Source: b
  %"b_load" = load i8, i8* %"b"
  ;  Source: a<b
  %".10" = icmp slt i8 %"a_load", %"b_load"
  %".11" = zext i1 %".10" to i32
  ;  Source: printf("%d",a<b);
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %".11")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"