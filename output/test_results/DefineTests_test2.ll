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

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx=1.13;
  %".3" = fptosi float 0x3ff2147ae0000000 to i32
  store i32 %".3", i32* %"x"
  %".5" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: printf("%d",2048);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 2048)
  %".8" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: printf("%f",x);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"x.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%f\00"