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
  %"non_const_pointer_load" = load i32*, i32** %"non_const_pointer"
  ;  Source: *non_const_pointer
  %"deref_load" = load i32, i32* %"non_const_pointer_load"
  ;  Source: printf("%d",*non_const_pointer);
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %"deref_load")
  ;  Source: non_const_pointer
  %"non_const_pointer_load.1" = load i32*, i32** %"non_const_pointer"
  %"deref_load.1" = load i32, i32* %"non_const_pointer_load.1"
  ;  Source: *non_const_pointer=36941;
  store i32 36941, i32* %"non_const_pointer_load.1"
  %".13" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: non_const_pointer
  %"non_const_pointer_load.2" = load i32*, i32** %"non_const_pointer"
  ;  Source: *non_const_pointer
  %"deref_load.2" = load i32, i32* %"non_const_pointer_load.2"
  ;  Source: printf("%d",*non_const_pointer);
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %"deref_load.2")
  ;  Source: non_const_pointer
  %"non_const_pointer_load.3" = load i32*, i32** %"non_const_pointer"
  ;  Source: b
  ;  Source: &b
  ;  Source: non_const_pointer=&b;
  store i32* %"b", i32** %"non_const_pointer"
  %".23" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: non_const_pointer
  %"non_const_pointer_load.4" = load i32*, i32** %"non_const_pointer"
  ;  Source: *non_const_pointer
  %"deref_load.3" = load i32, i32* %"non_const_pointer_load.4"
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
  %"char_ptr_load" = load i8*, i8** %"char_ptr"
  ;  Source: *char_ptr
  %"deref_load.4" = load i8, i8* %"char_ptr_load"
  ;  Source: printf("%c",*char_ptr);
  %".35" = sext i8 %"deref_load.4" to i32
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".31", i32 %".35")
  ;  Source: char_ptr
  %"char_ptr_load.1" = load i8*, i8** %"char_ptr"
  %"deref_load.5" = load i8, i8* %"char_ptr_load.1"
  ;  Source: *char_ptr='\t';
  store i8 9, i8* %"char_ptr_load.1"
  %".40" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: char_ptr
  %"char_ptr_load.2" = load i8*, i8** %"char_ptr"
  ;  Source: *char_ptr
  %"deref_load.6" = load i8, i8* %"char_ptr_load.2"
  ;  Source: printf("%c",*char_ptr);
  %".44" = sext i8 %"deref_load.6" to i32
  %".45" = call i32 (i8*, ...) @"printf"(i8* %".40", i32 %".44")
  ;  Source: char_ptr
  %"char_ptr_load.3" = load i8*, i8** %"char_ptr"
  ;  Source: nl
  %"nl_load" = load i8, i8* %"nl"
  ;  Source: &nl
  ;  Source: char_ptr=&nl;
  store i8* %"nl", i8** %"char_ptr"
  %".51" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: char_ptr
  %"char_ptr_load.4" = load i8*, i8** %"char_ptr"
  ;  Source: *char_ptr
  %"deref_load.7" = load i8, i8* %"char_ptr_load.4"
  ;  Source: printf("%c",*char_ptr);
  %".55" = sext i8 %"deref_load.7" to i32
  %".56" = call i32 (i8*, ...) @"printf"(i8* %".51", i32 %".55")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%c\00"
@"str.4" = internal constant [3 x i8] c"%c\00"
@"str.5" = internal constant [3 x i8] c"%c\00"