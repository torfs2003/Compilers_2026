; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i8
  ;  Source: charx='x';
  store i8 120, i8* %"x"
  %"dot" = alloca i8
  ;  Source: chardot='.';
  store i8 46, i8* %"dot"
  ret i32 0
}
