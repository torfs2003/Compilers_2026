; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx=1;
  store i32 1, i32* %"x"
  ;  Source: intx=2;
  store i32 2, i32* %"x"
  ;  Source: return0;
  ret i32 0
}
