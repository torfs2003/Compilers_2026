; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx=1;
  store i32 1, i32* %"x"
  ;  Source: intx=2;
  store i32 2, i32* %"x"
  ;  Source: intx=3;
  store i32 3, i32* %"x"
  %"y" = alloca i32
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: inty=x;
  store i32 %"x.1", i32* %"y"
  ;  Source: intx=4;
  store i32 4, i32* %"x"
  %"z" = alloca i32
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: intz=x;
  store i32 %"x.2", i32* %"z"
  ;  Source: intx=5;
  store i32 5, i32* %"x"
  ;  Source: return0;
  ret i32 0
}
