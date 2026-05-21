; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 25, i32* %"x"
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: x=25;
  store i32 25, i32* %"x"
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: x=-6532;
  store i32 -6532, i32* %"x"
  ret i32 0
}
