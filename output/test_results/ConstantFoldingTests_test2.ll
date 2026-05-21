; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 65, i32* %"a"
  %"b" = alloca i32
  store i32 1, i32* %"b"
  %"c" = alloca i32
  store i32 24, i32* %"c"
  %"d" = alloca i32
  store i32 -6, i32* %"d"
  %"e" = alloca i32
  store i32 13, i32* %"e"
  %"f" = alloca i32
  store i32 1, i32* %"f"
  %"g" = alloca i32
  store i32 1, i32* %"g"
  %"h" = alloca i32
  store i32 1, i32* %"h"
  %"j" = alloca float
  store float 0x4006000000000000, float* %"j"
  %"k" = alloca float
  store float 0x4024000000000000, float* %"k"
  ;  Source: return0;
  ret i32 0
}
