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
  %"d" = alloca i32
  %"c.1" = load float, float* %"c"
  %"b.2" = load i32, i32* %"b"
  %".7" = sitofp i32 %"b.2" to float
  %".8" = fadd float %"c.1", %".7"
  %"a.2" = load i8, i8* %"a"
  %".9" = sitofp i8 %"a.2" to float
  %".10" = fadd float %".8", %".9"
  %".11" = fptosi float %".10" to i32
  store i32 %".11", i32* %"d"
  %"e" = alloca i8
  %"d.1" = load i32, i32* %"d"
  %"c.2" = load float, float* %"c"
  %".13" = sitofp i32 %"d.1" to float
  %".14" = fadd float %".13", %"c.2"
  %"b.3" = load i32, i32* %"b"
  %".15" = sitofp i32 %"b.3" to float
  %".16" = fadd float %".14", %".15"
  %"a.3" = load i8, i8* %"a"
  %".17" = sitofp i8 %"a.3" to float
  %".18" = fadd float %".16", %".17"
  %".19" = fptosi float %".18" to i8
  store i8 %".19", i8* %"e"
  %"f" = alloca float
  %"e.1" = load i8, i8* %"e"
  %"d.2" = load i32, i32* %"d"
  %".21" = sext i8 %"e.1" to i32
  %".22" = add i32 %".21", %"d.2"
  %"c.3" = load float, float* %"c"
  %".23" = sitofp i32 %".22" to float
  %".24" = fadd float %".23", %"c.3"
  %"b.4" = load i32, i32* %"b"
  %".25" = sitofp i32 %"b.4" to float
  %".26" = fadd float %".24", %".25"
  %"a.4" = load i8, i8* %"a"
  %".27" = sitofp i8 %"a.4" to float
  %".28" = fadd float %".26", %".27"
  store float %".28", float* %"f"
  ;  Source: return0;
  ret i32 0
}
