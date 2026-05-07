; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx=1;
  store i32 1, i32* %"x"
  %"y" = alloca i32
  ;  Source: inty=0;
  store i32 0, i32* %"y"
  %"z" = alloca i32
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: y
  %"y.1" = load i32, i32* %"y"
  ;  Source: x&y
  %".9" = and i32 %"x.1", %"y.1"
  ;  Source: intz=x&y;
  store i32 %".9", i32* %"z"
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  ;  Source: z
  %"z.2" = load i32, i32* %"z"
  ;  Source: y
  %"y.2" = load i32, i32* %"y"
  ;  Source: z^y
  %".16" = xor i32 %"z.2", %"y.2"
  ;  Source: z=z^y;
  store i32 %".16", i32* %"z"
  ret i32 0
}
