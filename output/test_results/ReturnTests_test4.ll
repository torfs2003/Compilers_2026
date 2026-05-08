; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i8* @"d"()
{
entry:
  %"c" = alloca i8*
  %".2" = bitcast [7 x i8]* @"str" to i8*
  store i8* %".2", i8** %"c"
  ;  Source: returnc;
  %"c_load" = load i8*, i8** %"c"
  ret i8* %"c_load"
}

define i32 @"main"()
{
entry:
  %"c" = alloca i8*
  %".2" = bitcast [2 x i8]* @"str.1" to i8*
  store i8* %".2", i8** %"c"
  ;  Source: c
  %"c_load" = load i8*, i8** %"c"
  ;  Source: d()
  %".6" = call i8* @"d"()
  ;  Source: c=d();
  store i8* %".6", i8** %"c"
  %".9" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: c
  %"c_load.1" = load i8*, i8** %"c"
  ;  Source: printf("%s",c);
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".9", i8* %"c_load.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [7 x i8] c"blabla\00"
@"str.1" = internal constant [2 x i8] c"t\00"
@"str.2" = internal constant [3 x i8] c"%s\00"