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
  %".5" = fptosi float 0x4010ccccc0000000 to i8
  store i8 %".5", i8* %"c"
  %"d" = alloca i32
  %".7" = sext i8 97 to i32
  store i32 %".7", i32* %"d"
  %"e" = alloca i32
  store i32 5, i32* %"e"
  %"f" = alloca i32
  %".10" = fptosi float 0x4010ccccc0000000 to i32
  store i32 %".10", i32* %"f"
  %"g" = alloca float
  %".12" = sitofp i8 97 to float
  store float %".12", float* %"g"
  %"h" = alloca float
  %".14" = sitofp i32 5 to float
  store float %".14", float* %"h"
  %"i" = alloca float
  store float 0x4010ccccc0000000, float* %"i"
  %"j" = alloca float
  %"e.1" = load i32, i32* %"e"
  %".17" = sitofp i32 %"e.1" to float
  %".18" = fadd float %".17", 0x401a000000000000
  store float %".18", float* %"j"
  ;  Source: return0;
  ret i32 0
}
