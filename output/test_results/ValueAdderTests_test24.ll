; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"foo"()
{
entry:
  ;  Source: return4;
  ret i32 4
}

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  %".2" = call i32 @"foo"()
  store i32 %".2", i32* %"x"
  %"y" = alloca i32
  %"x.1" = load i32, i32* %"x"
  store i32 %"x.1", i32* %"y"
  %"z" = alloca i32
  %"x.2" = load i32, i32* %"x"
  store i32 %"x.2", i32* %"z"
  ;  Source: return0;
  ret i32 0
}
