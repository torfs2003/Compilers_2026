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
  %"x" = alloca i8
  ;  Source: charx='a';
  store i8 97, i8* %"x"
  %"chr_ptr" = alloca i8*
  ;  Source: x
  %"x.1" = load i8, i8* %"x"
  ;  Source: &x
  ;  Source: char*chr_ptr=&x;
  store i8* %"x", i8** %"chr_ptr"
  %"another_char" = alloca i8
  ;  Source: charanother_char;
  ;  Source: chr_ptr
  %"chr_ptr.1" = load i8*, i8** %"chr_ptr"
  %"deref_load" = load i8, i8* %"chr_ptr.1"
  ;  Source: *chr_ptr='b';
  store i8 98, i8* %"chr_ptr.1"
  ;  Source: another_char
  %"another_char.1" = load i8, i8* %"another_char"
  ;  Source: chr_ptr
  %"chr_ptr.2" = load i8*, i8** %"chr_ptr"
  ;  Source: *chr_ptr
  %"deref_load.1" = load i8, i8* %"chr_ptr.2"
  ;  Source: another_char=*chr_ptr;
  store i8 %"deref_load.1", i8* %"another_char"
  ret i32 0
}
