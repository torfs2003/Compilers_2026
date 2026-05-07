; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx=478;
  store i32 478, i32* %"x"
  %"b" = alloca i32
  ;  Source: intb=-251454;
  store i32 -251454, i32* %"b"
  %"b_ptr" = alloca i32*
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: &b
  ;  Source: int*b_ptr=&b;
  store i32* %"b", i32** %"b_ptr"
  %".10" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  ;  Source: printf("%d",b);
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %"b.2")
  %".14" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: b_ptr
  %"b_ptr.1" = load i32*, i32** %"b_ptr"
  ;  Source: *b_ptr
  %"deref_load" = load i32, i32* %"b_ptr.1"
  ;  Source: printf("%d",*b_ptr);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"deref_load")
  %"x_ptr" = alloca i32**
  ;  Source: b_ptr
  %"b_ptr.2" = load i32*, i32** %"b_ptr"
  ;  Source: &b_ptr
  ;  Source: int**x_ptr=&b_ptr;
  store i32** %"b_ptr", i32*** %"x_ptr"
  %".23" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: b_ptr
  %"b_ptr.3" = load i32*, i32** %"b_ptr"
  ;  Source: *b_ptr
  %"deref_load.1" = load i32, i32* %"b_ptr.3"
  ;  Source: printf("%d",*b_ptr);
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %"deref_load.1")
  %".28" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: x_ptr
  %"x_ptr.1" = load i32**, i32*** %"x_ptr"
  %"deref_load.2" = load i32*, i32** %"x_ptr.1"
  ;  Source: **x_ptr
  %"deref_load.3" = load i32, i32* %"deref_load.2"
  ;  Source: printf("%d",**x_ptr);
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 %"deref_load.3")
  ;  Source: x_ptr
  %"x_ptr.2" = load i32**, i32*** %"x_ptr"
  ;  Source: b
  %"b.3" = load i32, i32* %"b"
  ;  Source: &b
  ;  Source: x_ptr=&b;
  %".37" = bitcast i32* %"b" to i32**
  store i32** %".37", i32*** %"x_ptr"
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"