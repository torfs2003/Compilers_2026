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
  %"x" = alloca i32
  store i32 10, i32* %"x"
  %"xp" = alloca i32*
  store i32* %"x", i32** %"xp"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: xp
  %"xp_load" = load i32*, i32** %"xp"
  ;  Source: *xp
  %"deref_load" = load i32, i32* %"xp_load"
  ;  Source: printf("%d",*xp);
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"deref_load")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"