; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: appelx=5;
  store i32 5, i32* %"x"
  ;  Source: return0;
  ret i32 0
}
