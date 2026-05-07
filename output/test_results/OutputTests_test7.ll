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
  %"nl" = alloca i8
  store i8 10, i8* %"nl"
  %".3" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: nl
  %"nl.1" = load i8, i8* %"nl"
  ;  Source: printf("%c",nl);
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".3", i8 %"nl.1")
  %"tab" = alloca i8
  store i8 9, i8* %"tab"
  %".8" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: tab
  %"tab.1" = load i8, i8* %"tab"
  ;  Source: printf("%c",tab);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".8", i8 %"tab.1")
  %"character_null" = alloca i8
  store i8 0, i8* %"character_null"
  %".13" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: character_null
  %"character_null.1" = load i8, i8* %"character_null"
  ;  Source: printf("%c",character_null);
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".13", i8 %"character_null.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%c\00"
@"str.2" = internal constant [3 x i8] c"%c\00"