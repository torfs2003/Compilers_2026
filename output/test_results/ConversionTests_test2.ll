; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca i8
  store i8 97, i8* %"a"
  %"b" = alloca i8
  %".3" = trunc i32 5 to i8
  store i8 %".3", i8* %"b"
  %"c" = alloca i8
  %".5" = fptosi float 0x4010ccccc0000000 to i32
  %".6" = icmp sgt i32 %".5", 127
  %".7" = select  i1 %".6", i32 127, i32 %".5"
  %".8" = trunc i32 %".7" to i8
  store i8 %".8", i8* %"c"
  %"d" = alloca i32
  %".10" = sext i8 97 to i32
  store i32 %".10", i32* %"d"
  %"e" = alloca i32
  store i32 5, i32* %"e"
  %"f" = alloca i32
  %".13" = fptosi float 0x4010ccccc0000000 to i32
  store i32 %".13", i32* %"f"
  %"g" = alloca float
  %".15" = sitofp i8 97 to float
  store float %".15", float* %"g"
  %"h" = alloca float
  %".17" = sitofp i32 5 to float
  store float %".17", float* %"h"
  %"i" = alloca float
  store float 0x4010ccccc0000000, float* %"i"
  %"j" = alloca float
  %"e_load" = load i32, i32* %"e"
  %".20" = sitofp i32 %"e_load" to float
  %".21" = fadd float %".20", 0x401a000000000000
  store float %".21", float* %"j"
  ;  Source: return0;
  ret i32 0
}
