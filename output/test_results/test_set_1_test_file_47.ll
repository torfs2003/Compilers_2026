; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"y" = alloca i32
  ;  Source: intconsty=6532;
  store i32 6532, i32* %"y"
  ret i32 0
}
