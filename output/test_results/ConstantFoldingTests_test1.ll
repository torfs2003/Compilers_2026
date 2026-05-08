; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca float
  store float 0x402e333340000000, float* %"a"
  %"b" = alloca i32
  %".3" = sub i8 48, 100
  %".4" = sub i8 %".3", 100
  %".5" = sext i8 %".4" to i32
  store i32 %".5", i32* %"b"
  %"c" = alloca float
  %".7" = sitofp i8 97 to float
  %".8" = fmul float 0x402e333340000000, %".7"
  store float %".8", float* %"c"
  %"d" = alloca i8
  %".10" = fptosi float 0x404b8cccc0000000 to i32
  %".11" = icmp sgt i32 %".10", 127
  %".12" = select  i1 %".11", i32 127, i32 %".10"
  %".13" = trunc i32 %".12" to i8
  store i8 %".13", i8* %"d"
  %"e" = alloca i8
  %".15" = sdiv i8 101, 97
  store i8 %".15", i8* %"e"
  %"f1" = alloca i8
  %".17" = sitofp i8 120 to float
  %".18" = fadd float 0x40e63900c0000000, %".17"
  %".19" = fadd float %".18",              0x0
  %".20" = fptosi float %".19" to i32
  %".21" = icmp sgt i32 %".20", 127
  %".22" = select  i1 %".21", i32 127, i32 %".20"
  %".23" = trunc i32 %".22" to i8
  store i8 %".23", i8* %"f1"
  %"f" = alloca i32
  store i32 3, i32* %"f"
  %"g" = alloca i32
  store i32 16, i32* %"g"
  %"h" = alloca i32
  store i32 4, i32* %"h"
  %"i" = alloca i32
  store i32 1, i32* %"i"
  %"j" = alloca i32
  store i32 7, i32* %"j"
  %"k" = alloca i32
  store i32 -6, i32* %"k"
  %"l" = alloca i32
  store i32 6, i32* %"l"
  %"m" = alloca i32
  store i32 0, i32* %"m"
  %"n" = alloca i32
  store i32 1, i32* %"n"
  %"o" = alloca i32
  store i32 0, i32* %"o"
  %"p" = alloca float
  store float 0x402c800000000000, float* %"p"
  %"q" = alloca float
  store float 0x403f333340000000, float* %"q"
  %"r" = alloca float
  store float 0x4014000000000000, float* %"r"
  %"x" = alloca float
  store float 0x408f400000000000, float* %"x"
  ;  Source: return0;
  ret i32 0
}
