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
  %"dot" = alloca i8
  store i8 46, i8* %"dot"
  ret i32 0
}
