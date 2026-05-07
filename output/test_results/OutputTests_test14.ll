; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
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
  %".10" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: non_const_pointer
  %"non_const_pointer.1" = load i32*, i32** %"non_const_pointer"
  ;  Source: *non_const_pointer
  %"deref_load" = load i32, i32* %"non_const_pointer.1"
  ;  Source: printf("%d",*non_const_pointer);
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %"deref_load")
  ;  Source: non_const_pointer
  %"non_const_pointer.2" = load i32*, i32** %"non_const_pointer"
  %"deref_load.1" = load i32, i32* %"non_const_pointer.2"
  ;  Source: *non_const_pointer=36941;
  store i32 36941, i32* %"non_const_pointer.2"
  %".18" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: non_const_pointer
  %"non_const_pointer.3" = load i32*, i32** %"non_const_pointer"
  ;  Source: *non_const_pointer
  %"deref_load.2" = load i32, i32* %"non_const_pointer.3"
  ;  Source: printf("%d",*non_const_pointer);
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %"deref_load.2")
  ;  Source: non_const_pointer
  %"non_const_pointer.4" = load i32*, i32** %"non_const_pointer"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: &b
  ;  Source: non_const_pointer=&b;
  store i32* %"b", i32** %"non_const_pointer"
  %".28" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: non_const_pointer
  %"non_const_pointer.5" = load i32*, i32** %"non_const_pointer"
  ;  Source: *non_const_pointer
  %"deref_load.3" = load i32, i32* %"non_const_pointer.5"
  ;  Source: printf("%d",*non_const_pointer);
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 %"deref_load.3")
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
  %".41" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: char_ptr
  %"char_ptr.1" = load i8*, i8** %"char_ptr"
  ;  Source: *char_ptr
  %"deref_load.4" = load i8, i8* %"char_ptr.1"
  ;  Source: printf("%c",*char_ptr);
  %".45" = call i32 (i8*, ...) @"printf"(i8* %".41", i8 %"deref_load.4")
  ;  Source: char_ptr
  %"char_ptr.2" = load i8*, i8** %"char_ptr"
  %"deref_load.5" = load i8, i8* %"char_ptr.2"
  ;  Source: *char_ptr='\t';
  store i8 9, i8* %"char_ptr.2"
  %".49" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: char_ptr
  %"char_ptr.3" = load i8*, i8** %"char_ptr"
  ;  Source: *char_ptr
  %"deref_load.6" = load i8, i8* %"char_ptr.3"
  ;  Source: printf("%c",*char_ptr);
  %".53" = call i32 (i8*, ...) @"printf"(i8* %".49", i8 %"deref_load.6")
  ;  Source: char_ptr
  %"char_ptr.4" = load i8*, i8** %"char_ptr"
  ;  Source: nl
  %"nl.1" = load i8, i8* %"nl"
  ;  Source: &nl
  ;  Source: char_ptr=&nl;
  store i8* %"nl", i8** %"char_ptr"
  %".59" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: char_ptr
  %"char_ptr.5" = load i8*, i8** %"char_ptr"
  ;  Source: *char_ptr
  %"deref_load.7" = load i8, i8* %"char_ptr.5"
  ;  Source: printf("%c",*char_ptr);
  %".63" = call i32 (i8*, ...) @"printf"(i8* %".59", i8 %"deref_load.7")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%c\00"
@"str.4" = internal constant [3 x i8] c"%c\00"
@"str.5" = internal constant [3 x i8] c"%c\00"