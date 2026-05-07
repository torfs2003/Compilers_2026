; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"b" = alloca i32
  ;  Source: constintb=-6250;
  store i32 -6250, i32* %"b"
  %"x" = alloca i32
  ;  Source: constintx=5;
  store i32 5, i32* %"x"
  %"non_const_pointer" = alloca i32*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: int*non_const_pointer=&x;
  store i32* %"x", i32** %"non_const_pointer"
  %"c" = alloca i8
  ;  Source: charc='x';
  store i8 120, i8* %"c"
  %"nl" = alloca i8
  ;  Source: charnl='\n';
  store i8 10, i8* %"nl"
  %"char_ptr" = alloca i8*
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: &c
  ;  Source: char*char_ptr=&c;
  store i8* %"c", i8** %"char_ptr"
  ;  Source: non_const_pointer
  %"non_const_pointer.1" = load i32*, i32** %"non_const_pointer"
  %"deref_load" = load i32, i32* %"non_const_pointer.1"
  ;  Source: *non_const_pointer=36941;
  store i32 36941, i32* %"non_const_pointer.1"
  ;  Source: non_const_pointer
  %"non_const_pointer.2" = load i32*, i32** %"non_const_pointer"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: &b
  ;  Source: non_const_pointer=&b;
  store i32* %"b", i32** %"non_const_pointer"
  ;  Source: char_ptr
  %"char_ptr.1" = load i8*, i8** %"char_ptr"
  %"deref_load.1" = load i8, i8* %"char_ptr.1"
  ;  Source: *char_ptr='\t';
  store i8 9, i8* %"char_ptr.1"
  ;  Source: char_ptr
  %"char_ptr.2" = load i8*, i8** %"char_ptr"
  ;  Source: nl
  %"nl.1" = load i8, i8* %"nl"
  ;  Source: &nl
  ;  Source: char_ptr=&nl;
  store i8* %"nl", i8** %"char_ptr"
  ret i32 0
}
