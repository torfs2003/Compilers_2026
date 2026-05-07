; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

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
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i8 %"c.1")
  %"chr_ptr" = alloca i8*
  ;  Source: c
  %"c.2" = load i8, i8* %"c"
  ;  Source: &c
  ;  Source: constchar*chr_ptr=&c;
  store i8* %"c", i8** %"chr_ptr"
  %".12" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: chr_ptr
  %"chr_ptr.1" = load i8*, i8** %"chr_ptr"
  ;  Source: *chr_ptr
  %"deref_load" = load i8, i8* %"chr_ptr.1"
  ;  Source: printf("%c",*chr_ptr);
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".12", i8 %"deref_load")
  %"non_const_ptr" = alloca i8*
  ;  Source: chr_ptr
  %"chr_ptr.2" = load i8*, i8** %"chr_ptr"
  ;  Source: char*non_const_ptr=chr_ptr;
  store i8* %"chr_ptr.2", i8** %"non_const_ptr"
  %".20" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: non_const_ptr
  %"non_const_ptr.1" = load i8*, i8** %"non_const_ptr"
  ;  Source: *non_const_ptr
  %"deref_load.1" = load i8, i8* %"non_const_ptr.1"
  ;  Source: printf("%c",*non_const_ptr);
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".20", i8 %"deref_load.1")
  ;  Source: non_const_ptr
  %"non_const_ptr.2" = load i8*, i8** %"non_const_ptr"
  %"deref_load.2" = load i8, i8* %"non_const_ptr.2"
  ;  Source: *non_const_ptr='c';
  store i8 99, i8* %"non_const_ptr.2"
  %".28" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: c
  %"c.3" = load i8, i8* %"c"
  ;  Source: printf("%c",c);
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".28", i8 %"c.3")
  %".32" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: non_const_ptr
  %"non_const_ptr.3" = load i8*, i8** %"non_const_ptr"
  ;  Source: *non_const_ptr
  %"deref_load.3" = load i8, i8* %"non_const_ptr.3"
  ;  Source: printf("%c",*non_const_ptr);
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".32", i8 %"deref_load.3")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%c\00"
@"str.2" = internal constant [3 x i8] c"%c\00"
@"str.3" = internal constant [3 x i8] c"%c\00"
@"str.4" = internal constant [3 x i8] c"%c\00"