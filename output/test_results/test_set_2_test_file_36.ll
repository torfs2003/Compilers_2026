; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

declare void @"f"(i32 %".1", i32 %".2")

define i32 @"main"()
{
entry:
  ret i32 0
}
