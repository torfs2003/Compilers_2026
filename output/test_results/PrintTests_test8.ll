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
  %"a" = alloca i32
  ;  Source: inta=0;
  store i32 0, i32* %"a"
  %"b" = alloca float
  ;  Source: floatb=5.2;
  store float 0x4014ccccc0000000, float* %"b"
  %"c" = alloca i8
  ;  Source: charc='a';
  store i8 97, i8* %"c"
  %".8" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: printf("%c",c);
  %".11" = zext i8 %"c.1" to i32
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %".11")
  %".13" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: b
  %"b.1" = load float, float* %"b"
  ;  Source: printf("%f",b);
  %".16" = fpext float %"b.1" to double
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".13", double %".16")
  %".18" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %"a.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%f\00"
@"str.2" = internal constant [3 x i8] c"%d\00"