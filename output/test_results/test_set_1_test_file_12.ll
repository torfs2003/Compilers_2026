; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"nl" = alloca i8
  store i8 10, i8* %"nl"
  %"tab" = alloca i8
  store i8 9, i8* %"tab"
  %"character_null" = alloca i8
  store i8 0, i8* %"character_null"
  ret i32 0
}
