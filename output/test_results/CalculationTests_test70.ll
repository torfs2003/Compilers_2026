; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca float
  ;  Source: floata=5.0;
  store float 0x4014000000000000, float* %"a"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.1" = load float, float* %"a"
  ;  Source: printf("%f",a);
  %".7" = fpext float %"a.1" to double
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".4", double %".7")
  %"b" = alloca i32
  ;  Source: intb=5;
  store i32 5, i32* %"b"
  %".11" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: printf("%d",b);
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %"b.1")
  %"c" = alloca i8
  ;  Source: charc='e';
  store i8 101, i8* %"c"
  %".17" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: printf("%c",c);
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".17", i8 %"c.1")
  %"d" = alloca float
  ;  Source: constfloatd=10.01;
  store float 0x4024051ec0000000, float* %"d"
  %".23" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: d
  %"d.1" = load float, float* %"d"
  ;  Source: printf("%f",d);
  %".26" = fpext float %"d.1" to double
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".23", double %".26")
  %"e" = alloca i32
  ;  Source: constinte=2;
  store i32 2, i32* %"e"
  %".30" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: e
  %"e.1" = load i32, i32* %"e"
  ;  Source: printf("%d",e);
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 %"e.1")
  %"f" = alloca i8
  ;  Source: constcharf='b';
  store i8 98, i8* %"f"
  %".36" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: c
  %"c.2" = load i8, i8* %"c"
  ;  Source: printf("%c",c);
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".36", i8 %"c.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%f\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%c\00"
@"str.3" = internal constant [3 x i8] c"%f\00"
@"str.4" = internal constant [3 x i8] c"%d\00"
@"str.5" = internal constant [3 x i8] c"%c\00"