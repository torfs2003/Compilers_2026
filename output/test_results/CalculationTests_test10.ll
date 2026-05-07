; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 98362, i32* %"x"
  %".3" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: printf("%d",x);
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %"x.1")
  %"x_ptr" = alloca i32*
  store i32* %"x", i32** %"x_ptr"
  %"p" = alloca i32**
  store i32** %"x_ptr", i32*** %"p"
  %".9" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: p
  %"p.1" = load i32**, i32*** %"p"
  %"deref_load" = load i32*, i32** %"p.1"
  ;  Source: x_ptr
  %"x_ptr.1" = load i32*, i32** %"x_ptr"
  ;  Source: *p==x_ptr
  %".13" = ptrtoint i32* %"deref_load" to i32
  %".14" = ptrtoint i32* %"x_ptr.1" to i32
  %".15" = icmp eq i32 %".13", %".14"
  %".16" = zext i1 %".15" to i32
  ;  Source: printf("%d",*p==x_ptr);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %".16")
  %"z" = alloca i32*
  store i32* %"x", i32** %"z"
  %".20" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: z
  %"z.1" = load i32*, i32** %"z"
  %"deref_load.1" = load i32, i32* %"z.1"
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: *z==x
  %".24" = icmp eq i32 %"deref_load.1", %"x.2"
  %".25" = zext i1 %".24" to i32
  ;  Source: printf("%d",*z==x);
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %".25")
  %"a" = alloca float
  store float 0x408ac20da0000000, float* %"a"
  %"a_ptr" = alloca float*
  store float* %"a", float** %"a_ptr"
  %".30" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: a_ptr
  %"a_ptr.1" = load float*, float** %"a_ptr"
  %"deref_load.2" = load float, float* %"a_ptr.1"
  ;  Source: a
  %"a.1" = load float, float* %"a"
  ;  Source: (*a_ptr==a)
  %".34" = fcmp oeq float %"deref_load.2", %"a.1"
  %".35" = zext i1 %".34" to i32
  ;  Source: (int)(*a_ptr==a)
  ;  Source: printf("%d",(int)(*a_ptr==a));
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 %".35")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"