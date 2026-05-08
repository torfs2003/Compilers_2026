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
  %"k" = alloca i32
  store i32 3, i32* %"k"
  %"z" = alloca i32
  %"k_load" = load i32, i32* %"k"
  store i32 %"k_load", i32* %"z"
  %".4" = bitcast [6 x i8]* @"str" to i8*
  ;  Source: k
  %"k_load.1" = load i32, i32* %"k"
  ;  Source: z
  %"z_load" = load i32, i32* %"z"
  ;  Source: printf("%d %d",k,z);
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"k_load.1", i32 %"z_load")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [6 x i8] c"%d %d\00"