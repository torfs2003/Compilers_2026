; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx=5;
  store i32 5, i32* %"x"
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: 5+&x;
  %".6" = getelementptr i32, i32* %"x", i32 5
  ;  Source: return1;
  ret i32 1
}
