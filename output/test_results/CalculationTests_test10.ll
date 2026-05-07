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

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx=98362;
  store i32 98362, i32* %"x"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"x.1")
  %"x_ptr" = alloca i32*
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: int*x_ptr=&x;
  store i32* %"x", i32** %"x_ptr"
  %"p" = alloca i32**
  ;  Source: x_ptr
  %"x_ptr.1" = load i32*, i32** %"x_ptr"
  ;  Source: &x_ptr
  ;  Source: int**p=&x_ptr;
  store i32** %"x_ptr", i32*** %"p"
  %".16" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: p
  %"p.1" = load i32**, i32*** %"p"
  %"deref_load" = load i32*, i32** %"p.1"
  ;  Source: x_ptr
  %"x_ptr.2" = load i32*, i32** %"x_ptr"
  ;  Source: *p==x_ptr
  %".20" = ptrtoint i32* %"deref_load" to i32
  %".21" = ptrtoint i32* %"x_ptr.2" to i32
  %".22" = icmp eq i32 %".20", %".21"
  %".23" = zext i1 %".22" to i32
  ;  Source: printf("%d",*p==x_ptr);
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 %".23")
  %"z" = alloca i32*
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: int*z=&x;
  store i32* %"x", i32** %"z"
  %".30" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: z
  %"z.1" = load i32*, i32** %"z"
  %"deref_load.1" = load i32, i32* %"z.1"
  ;  Source: x
  %"x.4" = load i32, i32* %"x"
  ;  Source: *z==x
  %".34" = icmp eq i32 %"deref_load.1", %"x.4"
  %".35" = zext i1 %".34" to i32
  ;  Source: printf("%d",*z==x);
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 %".35")
  %"a" = alloca float
  ;  Source: floata=856.25668;
  store float 0x408ac20da0000000, float* %"a"
  %"a_ptr" = alloca float*
  ;  Source: a
  %"a.1" = load float, float* %"a"
  ;  Source: &a
  ;  Source: float*a_ptr=&a;
  store float* %"a", float** %"a_ptr"
  %".44" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: a_ptr
  %"a_ptr.1" = load float*, float** %"a_ptr"
  %"deref_load.2" = load float, float* %"a_ptr.1"
  ;  Source: a
  %"a.2" = load float, float* %"a"
  ;  Source: (*a_ptr==a)
  %".48" = fcmp oeq float %"deref_load.2", %"a.2"
  %".49" = zext i1 %".48" to i32
  ;  Source: (int)(*a_ptr==a)
  ;  Source: printf("%d",(int)(*a_ptr==a));
  %".52" = call i32 (i8*, ...) @"printf"(i8* %".44", i32 %".49")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"