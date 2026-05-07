; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"c" = alloca i8
  store i8 97, i8* %"c"
  %"chr_ptr" = alloca i8*
  store i8* %"c", i8** %"chr_ptr"
  %"non_const_ptr" = alloca i8*
  %"chr_ptr.1" = load i8*, i8** %"chr_ptr"
  store i8* %"chr_ptr.1", i8** %"non_const_ptr"
  ;  Source: non_const_ptr
  %"non_const_ptr.1" = load i8*, i8** %"non_const_ptr"
  %"deref_load" = load i8, i8* %"non_const_ptr.1"
  ;  Source: *non_const_ptr='c';
  store i8 99, i8* %"non_const_ptr.1"
  ret i32 0
}
