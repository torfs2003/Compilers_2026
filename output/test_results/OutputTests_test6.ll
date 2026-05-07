; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i8
  store i8 120, i8* %"x"
  %".3" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: x
  %"x.1" = load i8, i8* %"x"
  ;  Source: printf("%c",x);
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".3", i8 %"x.1")
  %"dot" = alloca i8
  store i8 46, i8* %"dot"
  %".8" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: dot
  %"dot.1" = load i8, i8* %"dot"
  ;  Source: printf("%c",dot);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".8", i8 %"dot.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%c\00"
@"str.1" = internal constant [3 x i8] c"%c\00"