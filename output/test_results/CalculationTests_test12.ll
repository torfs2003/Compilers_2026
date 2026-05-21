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
  %".3" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: printf("%d",b);
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 -6250)
  %"x" = alloca i32
  store i32 5, i32* %"x"
  %".7" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: printf("%d",x);
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 5)
  %"non_const_pointer" = alloca i32*
  store i32* %"x", i32** %"non_const_pointer"
  ;  Source: non_const_pointer
  %"non_const_pointer_load" = load i32*, i32** %"non_const_pointer"
  %"deref_load" = load i32, i32* %"non_const_pointer_load"
  ;  Source: *non_const_pointer=36941;
  store i32 36941, i32* %"non_const_pointer_load"
  %".14" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: non_const_pointer
  %"non_const_pointer_load.1" = load i32*, i32** %"non_const_pointer"
  ;  Source: *non_const_pointer
  %"deref_load.1" = load i32, i32* %"non_const_pointer_load.1"
  ;  Source: printf("%d",*non_const_pointer);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"deref_load.1")
  ;  Source: non_const_pointer
  %"non_const_pointer_load.2" = load i32*, i32** %"non_const_pointer"
  ;  Source: b
  ;  Source: &b
  ;  Source: non_const_pointer=&b;
  store i32* %"b", i32** %"non_const_pointer"
  %".24" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: non_const_pointer
  %"non_const_pointer_load.3" = load i32*, i32** %"non_const_pointer"
  ;  Source: *non_const_pointer
  %"deref_load.2" = load i32, i32* %"non_const_pointer_load.3"
  ;  Source: printf("%d",*non_const_pointer);
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 %"deref_load.2")
  %"c" = alloca i8
  store i8 120, i8* %"c"
  %".30" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: c
  %"c_load" = load i8, i8* %"c"
  ;  Source: printf("%c",c);
  %".33" = sext i8 %"c_load" to i32
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 %".33")
  %"nl" = alloca i8
  store i8 10, i8* %"nl"
  %".36" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: nl
  %"nl_load" = load i8, i8* %"nl"
  ;  Source: printf("%c",nl);
  %".39" = sext i8 %"nl_load" to i32
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %".39")
  %"char_ptr" = alloca i8*
  store i8* %"c", i8** %"char_ptr"
  %".42" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: char_ptr
  %"char_ptr_load" = load i8*, i8** %"char_ptr"
  ;  Source: *char_ptr
  %"deref_load.3" = load i8, i8* %"char_ptr_load"
  ;  Source: printf("%c",*char_ptr);
  %".46" = sext i8 %"deref_load.3" to i32
  %".47" = call i32 (i8*, ...) @"printf"(i8* %".42", i32 %".46")
  ;  Source: char_ptr
  %"char_ptr_load.1" = load i8*, i8** %"char_ptr"
  %"deref_load.4" = load i8, i8* %"char_ptr_load.1"
  ;  Source: *char_ptr='\t';
  store i8 9, i8* %"char_ptr_load.1"
  %".51" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: char_ptr
  %"char_ptr_load.2" = load i8*, i8** %"char_ptr"
  ;  Source: *char_ptr
  %"deref_load.5" = load i8, i8* %"char_ptr_load.2"
  ;  Source: printf("%c",*char_ptr);
  %".55" = sext i8 %"deref_load.5" to i32
  %".56" = call i32 (i8*, ...) @"printf"(i8* %".51", i32 %".55")
  ;  Source: char_ptr
  %"char_ptr_load.3" = load i8*, i8** %"char_ptr"
  ;  Source: nl
  %"nl_load.1" = load i8, i8* %"nl"
  ;  Source: &nl
  ;  Source: char_ptr=&nl;
  store i8* %"nl", i8** %"char_ptr"
  %".62" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: char_ptr
  %"char_ptr_load.4" = load i8*, i8** %"char_ptr"
  ;  Source: *char_ptr
  %"deref_load.6" = load i8, i8* %"char_ptr_load.4"
  ;  Source: printf("%c",*char_ptr);
  %".66" = sext i8 %"deref_load.6" to i32
  %".67" = call i32 (i8*, ...) @"printf"(i8* %".62", i32 %".66")
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