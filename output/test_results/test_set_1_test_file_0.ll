; ModuleID = "cmm_module"
<<<<<<< HEAD
target triple = "x86_64-w64-windows-gnu"
=======
target triple = "x86_64-unknown-linux-gnu"
>>>>>>> origin/main
target datalayout = ""

define i32 @"main"()
{
entry:
  ;  Source: 2048>>-3;
  %".3" = ashr i32 2048, -3
  ret i32 0
}
