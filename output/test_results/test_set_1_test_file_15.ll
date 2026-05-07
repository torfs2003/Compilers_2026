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
  %"x" = alloca i32
  ;  Source: intx=4;
  store i32 4, i32* %"x"
  %"b" = alloca i32
  ;  Source: intb=9632;
  store i32 9632, i32* %"b"
  %"x_ptr" = alloca i32*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: constint*x_ptr=&x;
  store i32* %"x", i32** %"x_ptr"
  ;  Source: x_ptr
  %"x_ptr.1" = load i32*, i32** %"x_ptr"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: &b
  ;  Source: x_ptr=&b;
  store i32* %"b", i32** %"x_ptr"
  ret i32 0
}
