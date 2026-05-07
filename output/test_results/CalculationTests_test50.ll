; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 5, i32* %"a"
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: (char)5
  %".5" = trunc i32 5 to i8
  ;  Source: a=(char)5;
  %".7" = sext i8 %".5" to i32
  store i32 %".7", i32* %"a"
  ;  Source: return0;
  ret i32 0
}
