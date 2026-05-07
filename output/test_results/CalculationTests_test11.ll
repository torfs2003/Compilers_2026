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
  %".3" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  %"x.1" = load i8, i8* %"x"
  ;  Source: printf("%d",x);
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".3", i8 %"x.1")
  %"chr_ptr" = alloca i8*
  store i8* %"x", i8** %"chr_ptr"
  ;  Source: chr_ptr
  %"chr_ptr.1" = load i8*, i8** %"chr_ptr"
  %"deref_load" = load i8, i8* %"chr_ptr.1"
  ;  Source: *chr_ptr='b';
  store i8 98, i8* %"chr_ptr.1"
  %"another_char" = alloca i8
  %"chr_ptr.2" = load i8*, i8** %"chr_ptr"
  %"deref_load.1" = load i8, i8* %"chr_ptr.2"
  store i8 %"deref_load.1", i8* %"another_char"
  %".12" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: another_char
  %"another_char.1" = load i8, i8* %"another_char"
  ;  Source: printf("%d",another_char);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".12", i8 %"another_char.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"