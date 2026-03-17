; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  ;  Source: charx='a';
  %"x" = alloca i8
  store i8 97, i8* %"x"
  ;  Source: x
  %"x.1" = load i8, i8* %"x"
  ;  Source: &x
  ;  Source: char*chr_ptr=&x;
  %"chr_ptr" = alloca i8*
  store i8* %"x", i8** %"chr_ptr"
  ;  Source: charanother_char;
  %"another_char" = alloca i8
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
