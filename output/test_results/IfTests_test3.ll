; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 0, i32* %"a"
  %".3" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %"a.1")
  %"c" = alloca i32
  store i32 0, i32* %"c"
  %".8" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  ;  Source: printf("%d",c);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"c.1")
  %"q" = alloca i32
  store i32 0, i32* %"q"
  %".13" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: q
  %"q.1" = load i32, i32* %"q"
  ;  Source: printf("%d",q);
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %"q.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"