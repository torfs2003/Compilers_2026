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
  %".3" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  %"x_load" = load i8, i8* %"x"
  ;  Source: printf("%d",x);
  %".6" = sext i8 %"x_load" to i32
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %".6")
  %"chr_ptr" = alloca i8*
  store i8* %"x", i8** %"chr_ptr"
  ;  Source: chr_ptr
  %"chr_ptr_load" = load i8*, i8** %"chr_ptr"
  %"deref_load" = load i8, i8* %"chr_ptr_load"
  ;  Source: *chr_ptr='b';
  store i8 98, i8* %"chr_ptr_load"
  %"another_char" = alloca i8
  %"chr_ptr_load.1" = load i8*, i8** %"chr_ptr"
  %"deref_load.1" = load i8, i8* %"chr_ptr_load.1"
  store i8 %"deref_load.1", i8* %"another_char"
  %".13" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: another_char
  %"another_char_load" = load i8, i8* %"another_char"
  ;  Source: printf("%d",another_char);
  %".16" = sext i8 %"another_char_load" to i32
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %".16")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"