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

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"x" = alloca i8
  ;  Source: charx='a';
  store i8 97, i8* %"x"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  %"x.1" = load i8, i8* %"x"
  ;  Source: printf("%d",x);
  %".7" = zext i8 %"x.1" to i32
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %".7")
  %"chr_ptr" = alloca i8*
  ;  Source: x
  %"x.2" = load i8, i8* %"x"
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
  %".20" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: another_char
  %"another_char.1" = load i8, i8* %"another_char"
  ;  Source: printf("%d",another_char);
  %".23" = zext i8 %"another_char.1" to i32
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %".23")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"