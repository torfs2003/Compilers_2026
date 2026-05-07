; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"b" = alloca i32
  %".2" = trunc i32 5 to i8
  %".3" = sext i8 %".2" to i32
  store i32 %".3", i32* %"b"
  %"a" = alloca float
  %"b.1" = load i32, i32* %"b"
  %".5" = sitofp i32 %"b.1" to float
  store float %".5", float* %"a"
  %"c" = alloca i32
  %".7" = fptosi float 0x4016000000000000 to i32
  store i32 %".7", i32* %"c"
  %"d" = alloca i8
  %"c.1" = load i32, i32* %"c"
  %".9" = trunc i32 %"c.1" to i8
  store i8 %".9", i8* %"d"
  %"e" = alloca i8
  %"b.2" = load i32, i32* %"b"
  %".11" = sitofp i32 %"b.2" to float
  %".12" = fadd float %".11", 0x400c000000000000
  %".13" = fptosi float %".12" to i8
  store i8 %".13", i8* %"e"
  %"f" = alloca i8
  %"e.1" = load i8, i8* %"e"
  %".15" = sext i8 %"e.1" to i32
  %".16" = sext i8 97 to i32
  %".17" = add i32 %".15", %".16"
  %".18" = trunc i32 %".17" to i8
  store i8 %".18", i8* %"f"
  ;  Source: return0;
  ret i32 0
}
