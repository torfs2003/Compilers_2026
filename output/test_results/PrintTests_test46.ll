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
  %"s" = alloca i32*
  %"k" = alloca i8*
  %".2" = bitcast [6 x i8]* @"str" to i8*
  store i8* %".2", i8** %"k"
  ;  Source: k
  %"k_load" = load i8*, i8** %"k"
  ;  Source: printf(5,k);
  %".6" = inttoptr i32 5 to i8*
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".6", i8* %"k_load")
  ;  Source: s
  %"s_load" = load i32*, i32** %"s"
  ;  Source: k
  %"k_load.1" = load i8*, i8** %"k"
  ;  Source: scanf(s,k);
  %".11" = bitcast i32* %"s_load" to i8*
  %".12" = call i32 (i8*, ...) @"scanf"(i8* %".11", i8* %"k_load.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [6 x i8] c"Hello\00"