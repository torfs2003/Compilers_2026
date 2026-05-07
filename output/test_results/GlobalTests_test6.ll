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
  %"True" = alloca i32
  store i32 -20, i32* %"True"
  %"success" = alloca i32
  %"True.1" = load i32, i32* %"True"
  store i32 %"True.1", i32* %"success"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: success
  %"success.1" = load i32, i32* %"success"
  ;  Source: printf("%d",success);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"success.1")
  ;  Source: return0;
  ret i32 0
}

@"True" = internal global i32 1
@"str" = internal constant [3 x i8] c"%d\00"