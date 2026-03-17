; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  ;  Source: charx='x';
  %"x" = alloca i8
  store i8 120, i8* %"x"
  ;  Source: chardot='.';
  %"dot" = alloca i8
  store i8 46, i8* %"dot"
  ret i32 0
}
