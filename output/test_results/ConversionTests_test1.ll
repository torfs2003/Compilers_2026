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
  %"b_load" = load i32, i32* %"b"
  %".5" = sitofp i32 %"b_load" to float
  store float %".5", float* %"a"
  %"c" = alloca i32
  %".7" = fptosi float 0x4016000000000000 to i32
  store i32 %".7", i32* %"c"
  %"d" = alloca i8
  %"c_load" = load i32, i32* %"c"
  %".9" = trunc i32 %"c_load" to i8
  store i8 %".9", i8* %"d"
  %"e" = alloca i8
  %"b_load.1" = load i32, i32* %"b"
  %".11" = sitofp i32 %"b_load.1" to float
  %".12" = fadd float %".11", 0x400c000000000000
  %".13" = fptosi float %".12" to i32
  %".14" = icmp sgt i32 %".13", 127
  %".15" = select  i1 %".14", i32 127, i32 %".13"
  %".16" = trunc i32 %".15" to i8
  store i8 %".16", i8* %"e"
  %"f" = alloca i8
  %"e_load" = load i8, i8* %"e"
  %".18" = sext i8 %"e_load" to i32
  %".19" = sext i8 97 to i32
  %".20" = add i32 %".18", %".19"
  %".21" = trunc i32 %".20" to i8
  store i8 %".21", i8* %"f"
  ;  Source: return0;
  ret i32 0
}
