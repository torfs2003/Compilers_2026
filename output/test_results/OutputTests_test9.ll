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
  store i32 98362, i32* %"x"
  %".3" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: printf("%x",x);
  %".5" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 98362)
  %"x_ptr" = alloca i32*
  store i32* %"x", i32** %"x_ptr"
  %".7" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: x_ptr
  %"x_ptr_load" = load i32*, i32** %"x_ptr"
  ;  Source: *x_ptr
  %"deref_load" = load i32, i32* %"x_ptr_load"
  ;  Source: printf("%x",*x_ptr);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %"deref_load")
  %"p" = alloca i32**
  store i32** %"x_ptr", i32*** %"p"
  %".13" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: p
  %"p_load" = load i32**, i32*** %"p"
  %"deref_load.1" = load i32*, i32** %"p_load"
  ;  Source: **p
  %"deref_load.2" = load i32, i32* %"deref_load.1"
  ;  Source: printf("%x",**p);
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %"deref_load.2")
  %"z" = alloca i32*
  store i32* %"x", i32** %"z"
  %".19" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: z
  %"z_load" = load i32*, i32** %"z"
  ;  Source: *z
  %"deref_load.3" = load i32, i32* %"z_load"
  ;  Source: printf("%x",*z);
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %"deref_load.3")
  %"a" = alloca float
  store float 0x408ac20da0000000, float* %"a"
  %".25" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: printf("%f",a);
  %".27" = fpext float 0x408ac20da0000000 to double
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".25", double %".27")
  %"a_ptr" = alloca float*
  store float* %"a", float** %"a_ptr"
  %".30" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: a_ptr
  %"a_ptr_load" = load float*, float** %"a_ptr"
  ;  Source: *a_ptr
  %"deref_load.4" = load float, float* %"a_ptr_load"
  ;  Source: printf("%f",*a_ptr);
  %".34" = fpext float %"deref_load.4" to double
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".30", double %".34")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%x\00"
@"str.1" = internal constant [3 x i8] c"%x\00"
@"str.2" = internal constant [3 x i8] c"%x\00"
@"str.3" = internal constant [3 x i8] c"%x\00"
@"str.4" = internal constant [3 x i8] c"%f\00"
@"str.5" = internal constant [3 x i8] c"%f\00"