; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"b" = alloca i32
  ;  Source: intb=5;
  store i32 5, i32* %"b"
  %"c" = alloca i32
  ;  Source: intc=7;
  store i32 7, i32* %"c"
  %"d" = alloca i32
  ;  Source: intd=0;
  store i32 0, i32* %"d"
  %"a" = alloca i32
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  %".10" = and i32 %"b.1", %"c.1"
  ;  Source: d
  %"d.1" = load i32, i32* %"d"
  ;  Source: (b&&c||d)
  %".13" = or i32 %".10", %"d.1"
  ;  Source: inta=(b&&c||d);
  store i32 %".13", i32* %"a"
  ;  Source: return0;
  ret i32 0
}
