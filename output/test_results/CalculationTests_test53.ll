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
  %"sa" = alloca i32*
  store i32* %"a", i32** %"sa"
  %"sb" = alloca i32*
  store i32* %"a", i32** %"sb"
  ;  Source: sa
  %"sa.1" = load i32*, i32** %"sa"
  ;  Source: sb
  %"sb.1" = load i32*, i32** %"sb"
  ;  Source: sa-sb;
  %".7" = ptrtoint i32* %"sa.1" to i32
  %".8" = ptrtoint i32* %"sb.1" to i32
  %".9" = sub i32 %".7", %".8"
  %".10" = sdiv i32 %".9", 1
  ;  Source: return0;
  ret i32 0
}
