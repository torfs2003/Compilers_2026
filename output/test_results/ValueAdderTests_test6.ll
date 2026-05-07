; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca i8
  store i8 97, i8* %"a"
  %"b" = alloca i32
  %"a.1" = load i8, i8* %"a"
  %".3" = sext i8 %"a.1" to i32
  store i32 %".3", i32* %"b"
  %"c" = alloca float
  %"b.1" = load i32, i32* %"b"
  %".5" = sitofp i32 %"b.1" to float
  store float %".5", float* %"c"
  %"d" = alloca float
  store float 0x401accccc0000000, float* %"d"
  %"e" = alloca i32
  store i32 5, i32* %"e"
  %"q" = alloca i8
  store i8 98, i8* %"q"
  %"g" = alloca i8
  %"a.2" = load i8, i8* %"a"
  %"c.1" = load float, float* %"c"
  %".10" = sitofp i8 %"a.2" to float
  %".11" = fadd float %".10", %"c.1"
  %"e.1" = load i32, i32* %"e"
  %".12" = sitofp i32 %"e.1" to float
  %".13" = fadd float %".11", %".12"
  %"b.2" = load i32, i32* %"b"
  %".14" = sitofp i32 %"b.2" to float
  %".15" = fadd float %".13", %".14"
  %"e.2" = load i32, i32* %"e"
  %".16" = sitofp i32 %"e.2" to float
  %".17" = fadd float %".15", %".16"
  %"q.1" = load i8, i8* %"q"
  %".18" = sitofp i8 %"q.1" to float
  %".19" = fadd float %".17", %".18"
  %"d.1" = load float, float* %"d"
  %".20" = fadd float %".19", %"d.1"
  %".21" = fptosi float %".20" to i8
  store i8 %".21", i8* %"g"
  ;  Source: return0;
  ret i32 0
}
