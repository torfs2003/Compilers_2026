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

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

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
  %".20" = zext i8 %"c.1" to i32
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".17", i32 %".20")
  %"d" = alloca float
  ;  Source: constfloatd=10.01;
  store float 0x4024051ec0000000, float* %"d"
  %".24" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: d
  %"d.1" = load float, float* %"d"
  ;  Source: printf("%f",d);
  %".27" = fpext float %"d.1" to double
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".24", double %".27")
  %"e" = alloca i32
  ;  Source: constinte=2;
  store i32 2, i32* %"e"
  %".31" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: e
  %"e.1" = load i32, i32* %"e"
  ;  Source: printf("%d",e);
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".31", i32 %"e.1")
  %"f" = alloca i8
  ;  Source: constcharf='b';
  store i8 98, i8* %"f"
  %".37" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: c
  %"c.2" = load i8, i8* %"c"
  ;  Source: printf("%c",c);
  %".40" = zext i8 %"c.2" to i32
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".37", i32 %".40")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%f\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%c\00"
@"str.3" = internal constant [3 x i8] c"%f\00"
@"str.4" = internal constant [3 x i8] c"%d\00"
@"str.5" = internal constant [3 x i8] c"%c\00"