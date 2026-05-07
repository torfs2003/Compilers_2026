; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: constintx=2;
  store i32 2, i32* %"x"
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: x--;
  %".6" = load i32, i32* %"x"
  %".7" = sub i32 %".6", 1
  store i32 %".7", i32* %"x"
  ;  Source: return0;
  ret i32 0
}
