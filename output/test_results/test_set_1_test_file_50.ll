; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

<<<<<<< HEAD
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

=======
>>>>>>> origin/optionals
define i32 @"main"()
{
entry:
  %"c" = alloca i8
  ;  Source: constcharc='a';
  store i8 97, i8* %"c"
  %"chr_ptr" = alloca i8*
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: &c
  ;  Source: constchar*chr_ptr=&c;
  store i8* %"c", i8** %"chr_ptr"
  %"non_const_ptr" = alloca i8*
  ;  Source: chr_ptr
  %"chr_ptr.1" = load i8*, i8** %"chr_ptr"
  ;  Source: char*non_const_ptr=chr_ptr;
  store i8* %"chr_ptr.1", i8** %"non_const_ptr"
  ;  Source: non_const_ptr
  %"non_const_ptr.1" = load i8*, i8** %"non_const_ptr"
  %"deref_load" = load i8, i8* %"non_const_ptr.1"
  ;  Source: *non_const_ptr='c';
  store i8 99, i8* %"non_const_ptr.1"
  ret i32 0
}
