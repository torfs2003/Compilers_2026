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
  %"a" = alloca i32
  store i32 0, i32* %"a"
  %"b" = alloca float
  store float 0x4014ccccc0000000, float* %"b"
  %"c" = alloca i8
  store i8 97, i8* %"c"
  %".5" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: c
  %"c_load" = load i8, i8* %"c"
  ;  Source: printf("%c",c);
  %".8" = sext i8 %"c_load" to i32
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %".8")
  %".10" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: b
  %"b_load" = load float, float* %"b"
  ;  Source: printf("%f",b);
  %".13" = fpext float %"b_load" to double
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".10", double %".13")
  %".15" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: a
  %"a_load" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %"a_load")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%f\00"
@"str.2" = internal constant [3 x i8] c"%d\00"