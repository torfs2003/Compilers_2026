; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"true" = alloca i32
  ;  Source: Truetrue=3;
  store i32 3, i32* %"true"
  ;  Source: return0;
  ret i32 0
}
