; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: structva;
  %"c" = alloca i32*
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: &a
  ;  Source: unionv*c=&a;
  store i32* %"a", i32** %"c"
  ;  Source: return0;
  ret i32 0
}
