; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"b" = alloca i32
  ;  Source: ab=4;
  store i32 4, i32* %"b"
  %"x" = alloca i32
  ;  Source: ax=4;
  store i32 4, i32* %"x"
  ;  Source: return0;
  ret i32 0
}
