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
  %"a_load" = load float, float* %"a"
  ;  Source: printf("%f",a);
  %".6" = fpext float %"a_load" to double
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".3", double %".6")
  %"b" = alloca i32
  store i32 5, i32* %"b"
  %".9" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: b
  %"b_load" = load i32, i32* %"b"
  ;  Source: printf("%d",b);
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %"b_load")
  %"c" = alloca i8
  store i8 101, i8* %"c"
  %".14" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: c
  %"c_load" = load i8, i8* %"c"
  ;  Source: printf("%c",c);
  %".17" = sext i8 %"c_load" to i32
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %".17")
  %"d" = alloca float
  store float 0x4024051ec0000000, float* %"d"
  %".20" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: printf("%f",d);
  %".22" = fpext float 0x4024051ec0000000 to double
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".20", double %".22")
  %"e" = alloca i32
  store i32 2, i32* %"e"
  %".25" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: printf("%d",e);
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 2)
  %"f" = alloca i8
  store i8 98, i8* %"f"
  %".29" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: c
  %"c_load.1" = load i8, i8* %"c"
  ;  Source: printf("%c",c);
  %".32" = sext i8 %"c_load.1" to i32
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".29", i32 %".32")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%f\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%c\00"
@"str.3" = internal constant [3 x i8] c"%f\00"
@"str.4" = internal constant [3 x i8] c"%d\00"
@"str.5" = internal constant [3 x i8] c"%c\00"