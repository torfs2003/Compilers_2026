; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"k" = alloca i32*
  %"result" = alloca i32
  %".2" = bitcast [3 x i8]* @"str" to i8*
  %".3" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 1)
  store i32 %".3", i32* %"result"
  %".5" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: result
  %"result.1" = load i32, i32* %"result"
  ;  Source: printf("%d",result);
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %"result.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"