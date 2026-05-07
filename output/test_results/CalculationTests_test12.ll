; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"b" = alloca i32
  store i32 -6250, i32* %"b"
  %".3" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: printf("%d",b);
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %"b.1")
  %"x" = alloca i32
  store i32 5, i32* %"x"
  %".8" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"x.1")
  %"non_const_pointer" = alloca i32*
  store i32* %"x", i32** %"non_const_pointer"
  ;  Source: non_const_pointer
  %"non_const_pointer.1" = load i32*, i32** %"non_const_pointer"
  %"deref_load" = load i32, i32* %"non_const_pointer.1"
  ;  Source: *non_const_pointer=36941;
  store i32 36941, i32* %"non_const_pointer.1"
  %".16" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: non_const_pointer
  %"non_const_pointer.2" = load i32*, i32** %"non_const_pointer"
  ;  Source: *non_const_pointer
  %"deref_load.1" = load i32, i32* %"non_const_pointer.2"
  ;  Source: printf("%d",*non_const_pointer);
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 %"deref_load.1")
  ;  Source: non_const_pointer
  %"non_const_pointer.3" = load i32*, i32** %"non_const_pointer"
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  ;  Source: &b
  ;  Source: non_const_pointer=&b;
  store i32* %"b", i32** %"non_const_pointer"
  %".26" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: non_const_pointer
  %"non_const_pointer.4" = load i32*, i32** %"non_const_pointer"
  ;  Source: *non_const_pointer
  %"deref_load.2" = load i32, i32* %"non_const_pointer.4"
  ;  Source: printf("%d",*non_const_pointer);
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 %"deref_load.2")
  %"c" = alloca i8
  store i8 120, i8* %"c"
  %".32" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: printf("%c",c);
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".32", i8 %"c.1")
  %"nl" = alloca i8
  store i8 10, i8* %"nl"
  %".37" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: nl
  %"nl.1" = load i8, i8* %"nl"
  ;  Source: printf("%c",nl);
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".37", i8 %"nl.1")
  %"char_ptr" = alloca i8*
  store i8* %"c", i8** %"char_ptr"
  %".42" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: char_ptr
  %"char_ptr.1" = load i8*, i8** %"char_ptr"
  ;  Source: *char_ptr
  %"deref_load.3" = load i8, i8* %"char_ptr.1"
  ;  Source: printf("%c",*char_ptr);
  %".46" = call i32 (i8*, ...) @"printf"(i8* %".42", i8 %"deref_load.3")
  ;  Source: char_ptr
  %"char_ptr.2" = load i8*, i8** %"char_ptr"
  %"deref_load.4" = load i8, i8* %"char_ptr.2"
  ;  Source: *char_ptr='\t';
  store i8 9, i8* %"char_ptr.2"
  %".50" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: char_ptr
  %"char_ptr.3" = load i8*, i8** %"char_ptr"
  ;  Source: *char_ptr
  %"deref_load.5" = load i8, i8* %"char_ptr.3"
  ;  Source: printf("%c",*char_ptr);
  %".54" = call i32 (i8*, ...) @"printf"(i8* %".50", i8 %"deref_load.5")
  ;  Source: char_ptr
  %"char_ptr.4" = load i8*, i8** %"char_ptr"
  ;  Source: nl
  %"nl.2" = load i8, i8* %"nl"
  ;  Source: &nl
  ;  Source: char_ptr=&nl;
  store i8* %"nl", i8** %"char_ptr"
  %".60" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: char_ptr
  %"char_ptr.5" = load i8*, i8** %"char_ptr"
  ;  Source: *char_ptr
  %"deref_load.6" = load i8, i8* %"char_ptr.5"
  ;  Source: printf("%c",*char_ptr);
  %".64" = call i32 (i8*, ...) @"printf"(i8* %".60", i8 %"deref_load.6")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%c\00"
@"str.5" = internal constant [3 x i8] c"%c\00"
@"str.6" = internal constant [3 x i8] c"%c\00"
@"str.7" = internal constant [3 x i8] c"%c\00"
@"str.8" = internal constant [3 x i8] c"%c\00"