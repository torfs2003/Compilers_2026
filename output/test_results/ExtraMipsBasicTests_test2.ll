; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"a"(i32 %".1")
{
entry:
  %"b" = alloca i32
  store i32 %".1", i32* %"b"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: printf("%d",4);
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 4)
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
define i32 @"main"()
{
entry:
  ;  Source: a(4);
  %".3" = call i32 @"a"(i32 4)
  ;  Source: return0;
  ret i32 0
}
