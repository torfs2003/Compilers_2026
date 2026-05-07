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
  %"s" = alloca i8*
  %".2" = bitcast [10 x i8]* @"str" to i8*
  ;  Source: char*s="string he";
  store i8* %".2", i8** %"s"
  %".5" = bitcast [7 x i8]* @"str.1" to i8*
  ;  Source: s
  %"s.1" = load i8*, i8** %"s"
  ;  Source: printf("%s  Hi",s);
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".5", i8* %"s.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [10 x i8] c"string he\00"
@"str.1" = internal constant [7 x i8] c"%s  Hi\00"