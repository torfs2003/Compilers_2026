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
  %"c" = alloca i8
  store i8 97, i8* %"c"
  %".3" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: printf("%c",c);
  %".5" = sext i8 97 to i32
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %".5")
  %"chr_ptr" = alloca i8*
  store i8* %"c", i8** %"chr_ptr"
  %".8" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: chr_ptr
  %"chr_ptr_load" = load i8*, i8** %"chr_ptr"
  ;  Source: *chr_ptr
  %"deref_load" = load i8, i8* %"chr_ptr_load"
  ;  Source: printf("%c",*chr_ptr);
  %".12" = sext i8 %"deref_load" to i32
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %".12")
  %"non_const_ptr" = alloca i8*
  %"chr_ptr_load.1" = load i8*, i8** %"chr_ptr"
  store i8* %"chr_ptr_load.1", i8** %"non_const_ptr"
  %".15" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: non_const_ptr
  %"non_const_ptr_load" = load i8*, i8** %"non_const_ptr"
  ;  Source: *non_const_ptr
  %"deref_load.1" = load i8, i8* %"non_const_ptr_load"
  ;  Source: printf("%c",*non_const_ptr);
  %".19" = sext i8 %"deref_load.1" to i32
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %".19")
  ;  Source: non_const_ptr
  %"non_const_ptr_load.1" = load i8*, i8** %"non_const_ptr"
  %"deref_load.2" = load i8, i8* %"non_const_ptr_load.1"
  ;  Source: *non_const_ptr='c';
  store i8 99, i8* %"non_const_ptr_load.1"
  %".24" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: c
  ;  Source: printf("%c",c);
  %".27" = sext i8 97 to i32
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 %".27")
  %".29" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: non_const_ptr
  %"non_const_ptr_load.2" = load i8*, i8** %"non_const_ptr"
  ;  Source: *non_const_ptr
  %"deref_load.3" = load i8, i8* %"non_const_ptr_load.2"
  ;  Source: printf("%c",*non_const_ptr);
  %".33" = sext i8 %"deref_load.3" to i32
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".29", i32 %".33")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%c\00"
@"str.2" = internal constant [3 x i8] c"%c\00"
@"str.3" = internal constant [3 x i8] c"%c\00"
@"str.4" = internal constant [3 x i8] c"%c\00"