; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"a"()
{
entry:
  ;  Source: return97;
  ret i32 97
}

define i32 @"main"()
{
entry:
  %"f" = alloca i8
  %".2" = call i32 @"a"()
  %".3" = trunc i32 %".2" to i8
  store i8 %".3", i8* %"f"
  %".5" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f
  %"f_load" = load i8, i8* %"f"
  ;  Source: printf("%c",f);
  %".8" = sext i8 %"f_load" to i32
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %".8")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"