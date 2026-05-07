; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx=1;
  store i32 1, i32* %"x"
  ;  Source: intx=3;
  store i32 3, i32* %"x"
  %"y" = alloca i32
  ;  Source: inty=2;
  store i32 2, i32* %"y"
  %"z" = alloca i32
  ;  Source: y
  %"y.1" = load i32, i32* %"y"
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: y+x
  %".11" = add i32 %"y.1", %"x.1"
  ;  Source: intz=y+x;
  store i32 %".11", i32* %"z"
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: intz=x;
  store i32 %"x.2", i32* %"z"
  ;  User Comment: // z should now be 1
  ;  Source: return0;
  ret i32 0
}
