; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

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
  ;  Source: chr_ptr
  %"chr_ptr.1" = load i8*, i8** %"chr_ptr"
  %"deref_load" = load i8, i8* %"chr_ptr.1"
  ;  Source: *chr_ptr='b';
  store i8 98, i8* %"chr_ptr.1"
  %"another_char" = alloca i8
  ;  Source: chr_ptr
  %"chr_ptr.2" = load i8*, i8** %"chr_ptr"
  ;  Source: *chr_ptr
  %"deref_load.1" = load i8, i8* %"chr_ptr.2"
  ;  Source: charanother_char=*chr_ptr;
  store i8 %"deref_load.1", i8* %"another_char"
  ret i32 0
}
