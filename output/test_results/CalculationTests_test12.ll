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
  %"b" = alloca i32
  ;  Source: constintb=-6250;
  store i32 -6250, i32* %"b"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: printf("%d",b);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"b.1")
  %"x" = alloca i32
  ;  Source: constintx=5;
  store i32 5, i32* %"x"
  %".10" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %"x.1")
  %"non_const_pointer" = alloca i32*
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: int*non_const_pointer=&x;
  store i32* %"x", i32** %"non_const_pointer"
  ;  Source: non_const_pointer
  %"non_const_pointer.1" = load i32*, i32** %"non_const_pointer"
  %"deref_load" = load i32, i32* %"non_const_pointer.1"
  ;  Source: *non_const_pointer=36941;
  store i32 36941, i32* %"non_const_pointer.1"
  %".21" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: non_const_pointer
  %"non_const_pointer.2" = load i32*, i32** %"non_const_pointer"
  ;  Source: *non_const_pointer
  %"deref_load.1" = load i32, i32* %"non_const_pointer.2"
  ;  Source: printf("%d",*non_const_pointer);
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %"deref_load.1")
  ;  Source: non_const_pointer
  %"non_const_pointer.3" = load i32*, i32** %"non_const_pointer"
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  ;  Source: &b
  ;  Source: non_const_pointer=&b;
  store i32* %"b", i32** %"non_const_pointer"
  %".31" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: non_const_pointer
  %"non_const_pointer.4" = load i32*, i32** %"non_const_pointer"
  ;  Source: *non_const_pointer
  %"deref_load.2" = load i32, i32* %"non_const_pointer.4"
  ;  Source: printf("%d",*non_const_pointer);
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".31", i32 %"deref_load.2")
  %"c" = alloca i8
  ;  Source: charc='x';
  store i8 120, i8* %"c"
  %".38" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: printf("%c",c);
  %".41" = zext i8 %"c.1" to i32
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".38", i32 %".41")
  %"nl" = alloca i8
  ;  Source: charnl='\n';
  store i8 10, i8* %"nl"
  %".45" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: nl
  %"nl.1" = load i8, i8* %"nl"
  ;  Source: printf("%c",nl);
  %".48" = zext i8 %"nl.1" to i32
  %".49" = call i32 (i8*, ...) @"printf"(i8* %".45", i32 %".48")
  %"char_ptr" = alloca i8*
  ;  Source: c
  %"c.2" = load i8, i8* %"c"
  ;  Source: &c
  ;  Source: char*char_ptr=&c;
  store i8* %"c", i8** %"char_ptr"
  %".54" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: char_ptr
  %"char_ptr.1" = load i8*, i8** %"char_ptr"
  ;  Source: *char_ptr
  %"deref_load.3" = load i8, i8* %"char_ptr.1"
  ;  Source: printf("%c",*char_ptr);
  %".58" = zext i8 %"deref_load.3" to i32
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".54", i32 %".58")
  ;  Source: char_ptr
  %"char_ptr.2" = load i8*, i8** %"char_ptr"
  %"deref_load.4" = load i8, i8* %"char_ptr.2"
  ;  Source: *char_ptr='\t';
  store i8 9, i8* %"char_ptr.2"
  %".63" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: char_ptr
  %"char_ptr.3" = load i8*, i8** %"char_ptr"
  ;  Source: *char_ptr
  %"deref_load.5" = load i8, i8* %"char_ptr.3"
  ;  Source: printf("%c",*char_ptr);
  %".67" = zext i8 %"deref_load.5" to i32
  %".68" = call i32 (i8*, ...) @"printf"(i8* %".63", i32 %".67")
  ;  Source: char_ptr
  %"char_ptr.4" = load i8*, i8** %"char_ptr"
  ;  Source: nl
  %"nl.2" = load i8, i8* %"nl"
  ;  Source: &nl
  ;  Source: char_ptr=&nl;
  store i8* %"nl", i8** %"char_ptr"
  %".74" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: char_ptr
  %"char_ptr.5" = load i8*, i8** %"char_ptr"
  ;  Source: *char_ptr
  %"deref_load.6" = load i8, i8* %"char_ptr.5"
  ;  Source: printf("%c",*char_ptr);
  %".78" = zext i8 %"deref_load.6" to i32
  %".79" = call i32 (i8*, ...) @"printf"(i8* %".74", i32 %".78")
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