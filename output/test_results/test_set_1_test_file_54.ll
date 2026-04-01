; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: boolx=1;
  store i32 1, i32* %"x"
  %"y" = alloca i32
  ;  Source: booly=0;
  store i32 0, i32* %"y"
  %"z" = alloca i32
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: y
  %"y.1" = load i32, i32* %"y"
  ;  Source: x&&y
  %".9" = and i32 %"x.1", %"y.1"
  ;  Source: intz=x&&y;
  store i32 %".9", i32* %"z"
  %"b" = alloca i32
  ;  Source: y
  %"y.2" = load i32, i32* %"y"
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  %".14" = mul i32 %"y.2", %"z.1"
  ;  Source: y*z*57809
  %".16" = mul i32 %".14", 57809
  ;  Source: boolb=y*z*57809;
  store i32 %".16", i32* %"b"
  ret i32 0
}
