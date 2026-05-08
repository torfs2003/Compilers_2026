; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca i8
  store i8 97, i8* %"a"
  %"b" = alloca i32
  %"a_load" = load i8, i8* %"a"
  %".3" = sext i8 %"a_load" to i32
  store i32 %".3", i32* %"b"
  %"c" = alloca float
  %"b_load" = load i32, i32* %"b"
  %".5" = sitofp i32 %"b_load" to float
  store float %".5", float* %"c"
  %"d" = alloca float
  store float 0x401accccc0000000, float* %"d"
  %"e" = alloca i32
  store i32 5, i32* %"e"
  %"q" = alloca i8
  store i8 98, i8* %"q"
  %"g" = alloca i8
  %"a_load.1" = load i8, i8* %"a"
  %"c_load" = load float, float* %"c"
  %".10" = sitofp i8 %"a_load.1" to float
  %".11" = fadd float %".10", %"c_load"
  %"e_load" = load i32, i32* %"e"
  %".12" = sitofp i32 %"e_load" to float
  %".13" = fadd float %".11", %".12"
  %"b_load.1" = load i32, i32* %"b"
  %".14" = sitofp i32 %"b_load.1" to float
  %".15" = fadd float %".13", %".14"
  %"e_load.1" = load i32, i32* %"e"
  %".16" = sitofp i32 %"e_load.1" to float
  %".17" = fadd float %".15", %".16"
  %"q_load" = load i8, i8* %"q"
  %".18" = sitofp i8 %"q_load" to float
  %".19" = fadd float %".17", %".18"
  %"d_load" = load float, float* %"d"
  %".20" = fadd float %".19", %"d_load"
  %".21" = fptosi float %".20" to i32
  %".22" = icmp sgt i32 %".21", 127
  %".23" = select  i1 %".22", i32 127, i32 %".21"
  %".24" = trunc i32 %".23" to i8
  store i8 %".24", i8* %"g"
  ;  Source: return0;
  ret i32 0
}
