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

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx=98362;
  store i32 98362, i32* %"x"
  %"x_ptr" = alloca i32*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: int*x_ptr=&x;
  store i32* %"x", i32** %"x_ptr"
  %".8" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x_ptr
  %"x_ptr.1" = load i32*, i32** %"x_ptr"
  ;  Source: *x_ptr
  %"deref_load" = load i32, i32* %"x_ptr.1"
  ;  Source: printf("%d",*x_ptr);
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"deref_load")
  %"p" = alloca i32**
  ;  Source: x_ptr
  %"x_ptr.2" = load i32*, i32** %"x_ptr"
  ;  Source: &x_ptr
  ;  Source: int**p=&x_ptr;
  store i32** %"x_ptr", i32*** %"p"
  %".17" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: p
  %"p.1" = load i32**, i32*** %"p"
  %"deref_load.1" = load i32*, i32** %"p.1"
  ;  Source: **p
  %"deref_load.2" = load i32, i32* %"deref_load.1"
  ;  Source: printf("%d",**p);
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".17", i32 %"deref_load.2")
  %"z" = alloca i32*
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: int*z=&x;
  store i32* %"x", i32** %"z"
  %".26" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: z
  %"z.1" = load i32*, i32** %"z"
  ;  Source: *z
  %"deref_load.3" = load i32, i32* %"z.1"
  ;  Source: printf("%d",*z);
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 %"deref_load.3")
  %"a" = alloca float
  ;  Source: floata=856.25668;
  store float 0x408ac20da0000000, float* %"a"
  %"a_ptr" = alloca float*
  ;  Source: a
  %"a.1" = load float, float* %"a"
  ;  Source: &a
  ;  Source: float*a_ptr=&a;
  store float* %"a", float** %"a_ptr"
  %".37" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: a_ptr
  %"a_ptr.1" = load float*, float** %"a_ptr"
  ;  Source: *a_ptr
  %"deref_load.4" = load float, float* %"a_ptr.1"
  ;  Source: printf("%f",*a_ptr);
  %".41" = fpext float %"deref_load.4" to double
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".37", double %".41")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%f\00"