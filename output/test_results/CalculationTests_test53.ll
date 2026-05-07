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

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: inta;
  %"sa" = alloca i32*
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: &a
  ;  Source: int*sa=&a;
  store i32* %"a", i32** %"sa"
  %"sb" = alloca i32*
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: &a
  ;  Source: int*sb=&a;
  store i32* %"a", i32** %"sb"
  ;  Source: sa
  %"sa.1" = load i32*, i32** %"sa"
  ;  Source: sb
  %"sb.1" = load i32*, i32** %"sb"
  ;  Source: sa-sb;
  %".14" = ptrtoint i32* %"sa.1" to i32
  %".15" = ptrtoint i32* %"sb.1" to i32
  %".16" = sub i32 %".14", %".15"
  %".17" = sdiv i32 %".16", 4
  ;  Source: return0;
  ret i32 0
}
