; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 25, i32* %"x"
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: x=25;
  store i32 25, i32* %"x"
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: x=-6532;
  store i32 -6532, i32* %"x"
  ;  Source: return0;
  ret i32 0
}
