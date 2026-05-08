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
  store i32 5, i32* %"a"
  %"b" = alloca i32*
  store i32* %"a", i32** %"b"
  %"c" = alloca i32**
  store i32** %"b", i32*** %"c"
  ;  Source: c
  %"c_load" = load i32**, i32*** %"c"
  ;  Source: c=0;
  %".7" = inttoptr i32 0 to i32**
  store i32** %".7", i32*** %"c"
  ;  Source: return0;
  ret i32 0
}
