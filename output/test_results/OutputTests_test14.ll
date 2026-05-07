; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"main"()
{
entry:
  %"b" = alloca i32
  store i32 -6250, i32* %"b"
  %"x" = alloca i32
  store i32 5, i32* %"x"
  %"non_const_pointer" = alloca i32*
  store i32* %"x", i32** %"non_const_pointer"
  %".5" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: non_const_pointer
  %"non_const_pointer.1" = load i32*, i32** %"non_const_pointer"
  ;  Source: *non_const_pointer
  %"deref_load" = load i32, i32* %"non_const_pointer.1"
  ;  Source: printf("%d",*non_const_pointer);
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %"deref_load")
  ;  Source: non_const_pointer
  %"non_const_pointer.2" = load i32*, i32** %"non_const_pointer"
  %"deref_load.1" = load i32, i32* %"non_const_pointer.2"
  ;  Source: *non_const_pointer=36941;
  store i32 36941, i32* %"non_const_pointer.2"
  %".13" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: non_const_pointer
  %"non_const_pointer.3" = load i32*, i32** %"non_const_pointer"
  ;  Source: *non_const_pointer
  %"deref_load.2" = load i32, i32* %"non_const_pointer.3"
  ;  Source: printf("%d",*non_const_pointer);
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %"deref_load.2")
  ;  Source: non_const_pointer
  %"non_const_pointer.4" = load i32*, i32** %"non_const_pointer"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: &b
  ;  Source: non_const_pointer=&b;
  store i32* %"b", i32** %"non_const_pointer"
  %".23" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: non_const_pointer
  %"non_const_pointer.5" = load i32*, i32** %"non_const_pointer"
  ;  Source: *non_const_pointer
  %"deref_load.3" = load i32, i32* %"non_const_pointer.5"
  ;  Source: printf("%d",*non_const_pointer);
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %"deref_load.3")
  %"c" = alloca i8
  store i8 120, i8* %"c"
  %"nl" = alloca i8
  store i8 10, i8* %"nl"
  %"char_ptr" = alloca i8*
  store i8* %"c", i8** %"char_ptr"
  %".31" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: char_ptr
  %"char_ptr.1" = load i8*, i8** %"char_ptr"
  ;  Source: *char_ptr
  %"deref_load.4" = load i8, i8* %"char_ptr.1"
  ;  Source: printf("%c",*char_ptr);
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".31", i8 %"deref_load.4")
  ;  Source: char_ptr
  %"char_ptr.2" = load i8*, i8** %"char_ptr"
  %"deref_load.5" = load i8, i8* %"char_ptr.2"
  ;  Source: *char_ptr='\t';
  store i8 9, i8* %"char_ptr.2"
  %".39" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: char_ptr
  %"char_ptr.3" = load i8*, i8** %"char_ptr"
  ;  Source: *char_ptr
  %"deref_load.6" = load i8, i8* %"char_ptr.3"
  ;  Source: printf("%c",*char_ptr);
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".39", i8 %"deref_load.6")
  ;  Source: char_ptr
  %"char_ptr.4" = load i8*, i8** %"char_ptr"
  ;  Source: nl
  %"nl.1" = load i8, i8* %"nl"
  ;  Source: &nl
  ;  Source: char_ptr=&nl;
  store i8* %"nl", i8** %"char_ptr"
  %".49" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: char_ptr
  %"char_ptr.5" = load i8*, i8** %"char_ptr"
  ;  Source: *char_ptr
  %"deref_load.7" = load i8, i8* %"char_ptr.5"
  ;  Source: printf("%c",*char_ptr);
  %".53" = call i32 (i8*, ...) @"printf"(i8* %".49", i8 %"deref_load.7")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%c\00"
@"str.4" = internal constant [3 x i8] c"%c\00"
@"str.5" = internal constant [3 x i8] c"%c\00"