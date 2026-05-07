; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx=10;
  store i32 10, i32* %"x"
  %"y" = alloca i32
  ;  Source: inty=20;
  store i32 20, i32* %"y"
  %"z" = alloca i32
  ;  Source: intz=30;
  store i32 30, i32* %"z"
  ;  Source: intz=20;
  store i32 20, i32* %"z"
  ;  Source: return0;
  ret i32 0
}
