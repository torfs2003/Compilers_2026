; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: appel2a=6;
  store i32 6, i32* %"a"
  ;  Source: return0;
  ret i32 0
}
