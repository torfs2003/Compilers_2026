; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"c" = alloca i8
  ;  Source: constcharc='a';
  store i8 97, i8* %"c"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: printf("%c",c);
  %".7" = zext i8 %"c.1" to i32
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %".7")
  %"chr_ptr" = alloca i8*
  ;  Source: c
  %"c.2" = load i8, i8* %"c"
  ;  Source: &c
  ;  Source: constchar*chr_ptr=&c;
  store i8* %"c", i8** %"chr_ptr"
  %".13" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: chr_ptr
  %"chr_ptr.1" = load i8*, i8** %"chr_ptr"
  ;  Source: *chr_ptr
  %"deref_load" = load i8, i8* %"chr_ptr.1"
  ;  Source: printf("%c",*chr_ptr);
  %".17" = zext i8 %"deref_load" to i32
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %".17")
  %"non_const_ptr" = alloca i8*
  ;  Source: chr_ptr
  %"chr_ptr.2" = load i8*, i8** %"chr_ptr"
  ;  Source: char*non_const_ptr=chr_ptr;
  store i8* %"chr_ptr.2", i8** %"non_const_ptr"
  %".22" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: non_const_ptr
  %"non_const_ptr.1" = load i8*, i8** %"non_const_ptr"
  ;  Source: *non_const_ptr
  %"deref_load.1" = load i8, i8* %"non_const_ptr.1"
  ;  Source: printf("%c",*non_const_ptr);
  %".26" = zext i8 %"deref_load.1" to i32
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %".26")
  ;  Source: non_const_ptr
  %"non_const_ptr.2" = load i8*, i8** %"non_const_ptr"
  %"deref_load.2" = load i8, i8* %"non_const_ptr.2"
  ;  Source: *non_const_ptr='c';
  store i8 99, i8* %"non_const_ptr.2"
  %".31" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: c
  %"c.3" = load i8, i8* %"c"
  ;  Source: printf("%c",c);
  %".34" = zext i8 %"c.3" to i32
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".31", i32 %".34")
  %".36" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: non_const_ptr
  %"non_const_ptr.3" = load i8*, i8** %"non_const_ptr"
  ;  Source: *non_const_ptr
  %"deref_load.3" = load i8, i8* %"non_const_ptr.3"
  ;  Source: printf("%c",*non_const_ptr);
  %".40" = zext i8 %"deref_load.3" to i32
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %".40")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%c\00"
@"str.2" = internal constant [3 x i8] c"%c\00"
@"str.3" = internal constant [3 x i8] c"%c\00"
@"str.4" = internal constant [3 x i8] c"%c\00"