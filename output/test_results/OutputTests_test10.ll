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
  %"x" = alloca i32
  store i32 4, i32* %"x"
  %"b" = alloca i32
  store i32 9632, i32* %"b"
  %"x_ptr" = alloca i32*
  store i32* %"x", i32** %"x_ptr"
  %".5" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x_ptr
  %"x_ptr_load" = load i32*, i32** %"x_ptr"
  ;  Source: *x_ptr
  %"deref_load" = load i32, i32* %"x_ptr_load"
  ;  Source: printf("%d",*x_ptr);
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %"deref_load")
  ;  Source: x_ptr
  %"x_ptr_load.1" = load i32*, i32** %"x_ptr"
  ;  Source: b
  %"b_load" = load i32, i32* %"b"
  ;  Source: &b
  ;  Source: x_ptr=&b;
  store i32* %"b", i32** %"x_ptr"
  %".15" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: x_ptr
  %"x_ptr_load.2" = load i32*, i32** %"x_ptr"
  ;  Source: *x_ptr
  %"deref_load.1" = load i32, i32* %"x_ptr_load.2"
  ;  Source: printf("%d",*x_ptr);
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %"deref_load.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"