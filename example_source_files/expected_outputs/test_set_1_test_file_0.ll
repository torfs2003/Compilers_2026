; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define i32 @"main"()
{
entry:
  ;  Source: 2048>>-3;
  %".3" = ashr i32 2048, -3
  ret i32 0
}
