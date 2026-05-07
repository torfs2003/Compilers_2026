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
  %"a" = alloca float
  store float 0x4014000000000000, float* %"a"
  %".3" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.1" = load float, float* %"a"
  ;  Source: printf("%f",a);
  %".6" = fpext float %"a.1" to double
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".3", double %".6")
  %"b" = alloca i32
  store i32 5, i32* %"b"
  %".9" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: printf("%d",b);
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %"b.1")
  %"c" = alloca i8
  store i8 101, i8* %"c"
  %".14" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: printf("%c",c);
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".14", i8 %"c.1")
  %"d" = alloca float
  store float 0x4024051ec0000000, float* %"d"
  %".19" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: d
  %"d.1" = load float, float* %"d"
  ;  Source: printf("%f",d);
  %".22" = fpext float %"d.1" to double
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".19", double %".22")
  %"e" = alloca i32
  store i32 2, i32* %"e"
  %".25" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: e
  %"e.1" = load i32, i32* %"e"
  ;  Source: printf("%d",e);
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 %"e.1")
  %"f" = alloca i8
  store i8 98, i8* %"f"
  %".30" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: c
  %"c.2" = load i8, i8* %"c"
  ;  Source: printf("%c",c);
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".30", i8 %"c.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%f\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%c\00"
@"str.3" = internal constant [3 x i8] c"%f\00"
@"str.4" = internal constant [3 x i8] c"%d\00"
@"str.5" = internal constant [3 x i8] c"%c\00"