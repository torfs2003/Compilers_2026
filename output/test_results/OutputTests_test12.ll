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
  %"x" = alloca i8
  store i8 97, i8* %"x"
  %"chr_ptr" = alloca i8*
  store i8* %"x", i8** %"chr_ptr"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: chr_ptr
  %"chr_ptr_load" = load i8*, i8** %"chr_ptr"
  ;  Source: *chr_ptr
  %"deref_load" = load i8, i8* %"chr_ptr_load"
  ;  Source: printf("%c",*chr_ptr);
  %".8" = sext i8 %"deref_load" to i32
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %".8")
  ;  Source: chr_ptr
  %"chr_ptr_load.1" = load i8*, i8** %"chr_ptr"
  %"deref_load.1" = load i8, i8* %"chr_ptr_load.1"
  ;  Source: *chr_ptr='b';
  store i8 98, i8* %"chr_ptr_load.1"
  %".13" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: chr_ptr
  %"chr_ptr_load.2" = load i8*, i8** %"chr_ptr"
  ;  Source: *chr_ptr
  %"deref_load.2" = load i8, i8* %"chr_ptr_load.2"
  ;  Source: printf("%c",*chr_ptr);
  %".17" = sext i8 %"deref_load.2" to i32
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %".17")
  %"another_char" = alloca i8
  %"chr_ptr_load.3" = load i8*, i8** %"chr_ptr"
  %"deref_load.3" = load i8, i8* %"chr_ptr_load.3"
  store i8 %"deref_load.3", i8* %"another_char"
  %".20" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: chr_ptr
  %"chr_ptr_load.4" = load i8*, i8** %"chr_ptr"
  ;  Source: *chr_ptr
  %"deref_load.4" = load i8, i8* %"chr_ptr_load.4"
  ;  Source: printf("%c",*chr_ptr);
  %".24" = sext i8 %"deref_load.4" to i32
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %".24")
  %".26" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: another_char
  %"another_char_load" = load i8, i8* %"another_char"
  ;  Source: printf("%c",another_char);
  %".29" = sext i8 %"another_char_load" to i32
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 %".29")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%c\00"
@"str.2" = internal constant [3 x i8] c"%c\00"
@"str.3" = internal constant [3 x i8] c"%c\00"