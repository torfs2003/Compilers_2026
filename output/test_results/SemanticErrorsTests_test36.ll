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

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: constinta=5;
  store i32 5, i32* %"a"
  %"b" = alloca i32*
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: &a
  ;  Source: constint*constb=&a;
  store i32* %"a", i32** %"b"
  %"c" = alloca i32**
  ;  Source: b
  %"b.1" = load i32*, i32** %"b"
  ;  Source: &b
  ;  Source: constint**constc=&b;
  store i32** %"b", i32*** %"c"
  ;  Source: c
  %"c.1" = load i32**, i32*** %"c"
  ;  Source: c=0;
  %".14" = inttoptr i32 0 to i32**
  store i32** %".14", i32*** %"c"
  ;  Source: return0;
  ret i32 0
}
