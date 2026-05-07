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
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: printf("%x",x);
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %"x.1")
  %"x_ptr" = alloca i32*
  store i32* %"x", i32** %"x_ptr"
  %".8" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: x_ptr
  %"x_ptr.1" = load i32*, i32** %"x_ptr"
  ;  Source: *x_ptr
  %"deref_load" = load i32, i32* %"x_ptr.1"
  ;  Source: printf("%x",*x_ptr);
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"deref_load")
  %"p" = alloca i32**
  store i32** %"x_ptr", i32*** %"p"
  %".14" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: p
  %"p.1" = load i32**, i32*** %"p"
  %"deref_load.1" = load i32*, i32** %"p.1"
  ;  Source: **p
  %"deref_load.2" = load i32, i32* %"deref_load.1"
  ;  Source: printf("%x",**p);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"deref_load.2")
  %"z" = alloca i32*
  store i32* %"x", i32** %"z"
  %".20" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: z
  %"z.1" = load i32*, i32** %"z"
  ;  Source: *z
  %"deref_load.3" = load i32, i32* %"z.1"
  ;  Source: printf("%x",*z);
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %"deref_load.3")
  %"a" = alloca float
  store float 0x408ac20da0000000, float* %"a"
  %".26" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: a
  %"a.1" = load float, float* %"a"
  ;  Source: printf("%f",a);
  %".29" = fpext float %"a.1" to double
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".26", double %".29")
  %"a_ptr" = alloca float*
  store float* %"a", float** %"a_ptr"
  %".32" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: a_ptr
  %"a_ptr.1" = load float*, float** %"a_ptr"
  ;  Source: *a_ptr
  %"deref_load.4" = load float, float* %"a_ptr.1"
  ;  Source: printf("%f",*a_ptr);
  %".36" = fpext float %"deref_load.4" to double
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".32", double %".36")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%x\00"
@"str.1" = internal constant [3 x i8] c"%x\00"
@"str.2" = internal constant [3 x i8] c"%x\00"
@"str.3" = internal constant [3 x i8] c"%x\00"
@"str.4" = internal constant [3 x i8] c"%f\00"
@"str.5" = internal constant [3 x i8] c"%f\00"