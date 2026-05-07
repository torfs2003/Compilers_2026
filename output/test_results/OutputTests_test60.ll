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

define i32 @"main"()
{
entry:
  %"d" = alloca i32
  ;  Source: intd=10;
  store i32 10, i32* %"d"
  %"a" = alloca i32*
  ;  Source: d
  %"d.1" = load i32, i32* %"d"
  ;  Source: &d
  ;  Source: constint*a=&d;
  store i32* %"d", i32** %"a"
  %"b" = alloca i32*
  ;  Source: a
  %"a.1" = load i32*, i32** %"a"
  ;  Source: (int*)a
  ;  Source: int*b=(int*)a;
  store i32* %"a.1", i32** %"b"
  %"c" = alloca i32*
  ;  Source: b
  %"b.1" = load i32*, i32** %"b"
  ;  Source: (constint*)b
  ;  Source: constint*c=(constint*)b;
  store i32* %"b.1", i32** %"c"
  ;  Source: c
  %"c.1" = load i32*, i32** %"c"
  %"deref_load" = load i32, i32* %"c.1"
  ;  Source: *c=15;
  store i32 15, i32* %"c.1"
  ;  Source: return0;
  ret i32 0
}
