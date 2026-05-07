; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i8
  store i8 97, i8* %"x"
  %"chr_ptr" = alloca i8*
  store i8* %"x", i8** %"chr_ptr"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: chr_ptr
  %"chr_ptr.1" = load i8*, i8** %"chr_ptr"
  ;  Source: *chr_ptr
  %"deref_load" = load i8, i8* %"chr_ptr.1"
  ;  Source: printf("%c",*chr_ptr);
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".4", i8 %"deref_load")
  ;  Source: chr_ptr
  %"chr_ptr.2" = load i8*, i8** %"chr_ptr"
  %"deref_load.1" = load i8, i8* %"chr_ptr.2"
  ;  Source: *chr_ptr='b';
  store i8 98, i8* %"chr_ptr.2"
  %".12" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: chr_ptr
  %"chr_ptr.3" = load i8*, i8** %"chr_ptr"
  ;  Source: *chr_ptr
  %"deref_load.2" = load i8, i8* %"chr_ptr.3"
  ;  Source: printf("%c",*chr_ptr);
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".12", i8 %"deref_load.2")
  %"another_char" = alloca i8
  %"chr_ptr.4" = load i8*, i8** %"chr_ptr"
  %"deref_load.3" = load i8, i8* %"chr_ptr.4"
  store i8 %"deref_load.3", i8* %"another_char"
  %".18" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: chr_ptr
  %"chr_ptr.5" = load i8*, i8** %"chr_ptr"
  ;  Source: *chr_ptr
  %"deref_load.4" = load i8, i8* %"chr_ptr.5"
  ;  Source: printf("%c",*chr_ptr);
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".18", i8 %"deref_load.4")
  %".23" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: another_char
  %"another_char.1" = load i8, i8* %"another_char"
  ;  Source: printf("%c",another_char);
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".23", i8 %"another_char.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%c\00"
@"str.2" = internal constant [3 x i8] c"%c\00"
@"str.3" = internal constant [3 x i8] c"%c\00"