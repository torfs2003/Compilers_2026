; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: constintx=98362;
  store i32 98362, i32* %"x"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: printf("%x",x);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"x.1")
  %"x_ptr" = alloca i32*
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: constint*x_ptr=&x;
  store i32* %"x", i32** %"x_ptr"
  %".12" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: x_ptr
  %"x_ptr.1" = load i32*, i32** %"x_ptr"
  ;  Source: *x_ptr
  %"deref_load" = load i32, i32* %"x_ptr.1"
  ;  Source: printf("%x",*x_ptr);
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 %"deref_load")
  %"p" = alloca i32**
  ;  Source: x_ptr
  %"x_ptr.2" = load i32*, i32** %"x_ptr"
  ;  Source: &x_ptr
  ;  Source: constint**p=&x_ptr;
  store i32** %"x_ptr", i32*** %"p"
  %".21" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: p
  %"p.1" = load i32**, i32*** %"p"
  %"deref_load.1" = load i32*, i32** %"p.1"
  ;  Source: **p
  %"deref_load.2" = load i32, i32* %"deref_load.1"
  ;  Source: printf("%x",**p);
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %"deref_load.2")
  %"z" = alloca i32*
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: constint*z=&x;
  store i32* %"x", i32** %"z"
  %".30" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: z
  %"z.1" = load i32*, i32** %"z"
  ;  Source: *z
  %"deref_load.3" = load i32, i32* %"z.1"
  ;  Source: printf("%x",*z);
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 %"deref_load.3")
  %"a" = alloca float
  ;  Source: constfloata=856.25668;
  store float 0x408ac20da0000000, float* %"a"
  %".37" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: a
  %"a.1" = load float, float* %"a"
  ;  Source: (int)a
  %".40" = fptosi float %"a.1" to i32
  ;  Source: printf("%d",(int)a);
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".37", i32 %".40")
  %"a_ptr" = alloca float*
  ;  Source: a
  %"a.2" = load float, float* %"a"
  ;  Source: &a
  ;  Source: constfloat*a_ptr=&a;
  store float* %"a", float** %"a_ptr"
  %".47" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: a_ptr
  %"a_ptr.1" = load float*, float** %"a_ptr"
  %"deref_load.4" = load float, float* %"a_ptr.1"
  ;  Source: (int)*a_ptr
  %".50" = fptosi float %"deref_load.4" to i32
  ;  Source: printf("%d",(int)*a_ptr);
  %".52" = call i32 (i8*, ...) @"printf"(i8* %".47", i32 %".50")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%x\00"
@"str.1" = internal constant [3 x i8] c"%x\00"
@"str.2" = internal constant [3 x i8] c"%x\00"
@"str.3" = internal constant [3 x i8] c"%x\00"
@"str.4" = internal constant [3 x i8] c"%d\00"
@"str.5" = internal constant [3 x i8] c"%d\00"