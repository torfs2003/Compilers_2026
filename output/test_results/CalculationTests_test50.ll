; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: inta=5;
  store i32 5, i32* %"a"
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: (char)5
  %".6" = trunc i32 5 to i8
  ;  Source: a=(char)5;
  %".8" = sext i8 %".6" to i32
  store i32 %".8", i32* %"a"
  ;  Source: return0;
  ret i32 0
}
