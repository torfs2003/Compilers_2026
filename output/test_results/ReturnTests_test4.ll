; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i8* @"d"()
{
entry:
  %"c" = alloca i8*
  %".2" = bitcast [7 x i8]* @"str" to i8*
  ;  Source: char*c="blabla";
  store i8* %".2", i8** %"c"
  ;  Source: returnc;
  %"c.1" = load i8*, i8** %"c"
  ret i8* %"c.1"
}

@"str" = internal constant [7 x i8] c"blabla\00"
define i32 @"main"()
{
entry:
  %"c" = alloca i8*
  %".2" = bitcast [2 x i8]* @"str.1" to i8*
  ;  Source: char*c="t";
  store i8* %".2", i8** %"c"
  ;  Source: c
  %"c.1" = load i8*, i8** %"c"
  ;  Source: d()
  %".7" = call i8* @"d"()
  ;  Source: c=d();
  store i8* %".7", i8** %"c"
  %".10" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: c
  %"c.2" = load i8*, i8** %"c"
  ;  Source: printf("%s",c);
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".10", i8* %"c.2")
  ;  Source: return0;
  ret i32 0
}

@"str.1" = internal constant [2 x i8] c"t\00"
@"str.2" = internal constant [3 x i8] c"%s\00"