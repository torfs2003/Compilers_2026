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
  %"g" = alloca i32
  %"e.2" = load i8, i8* %"e"
  %"d.3" = load i32, i32* %"d"
  %".30" = sext i8 %"e.2" to i32
  %".31" = add i32 %".30", %"d.3"
  %"c.4" = load float, float* %"c"
  %".32" = sitofp i32 %".31" to float
  %".33" = fadd float %".32", %"c.4"
  %"b.5" = load i32, i32* %"b"
  %".34" = sitofp i32 %"b.5" to float
  %".35" = fadd float %".33", %".34"
  %"a.5" = load i8, i8* %"a"
  %".36" = sitofp i8 %"a.5" to float
  %".37" = fadd float %".35", %".36"
  %"f.1" = load float, float* %"f"
  %".38" = fadd float %".37", %"f.1"
  %".39" = fptosi float %".38" to i32
  store i32 %".39", i32* %"g"
  %"h" = alloca i32
  %"g.1" = load i32, i32* %"g"
  %".41" = srem i32 %"g.1", 12
  store i32 %".41", i32* %"h"
  %"i" = alloca i32
  %"h.1" = load i32, i32* %"h"
  %"g.2" = load i32, i32* %"g"
  %"b.6" = load i32, i32* %"b"
  %".43" = mul i32 %"g.2", %"b.6"
  %"e.3" = load i8, i8* %"e"
  %".44" = sext i8 %"e.3" to i32
  %".45" = sdiv i32 %".43", %".44"
  %".46" = sub i32 %"h.1", %".45"
  store i32 %".46", i32* %"i"
  %"z" = alloca float
  store float 0x3feca8f1a0000000, float* %"z"
  %"y" = alloca i8
  store i8 97, i8* %"y"
  %"p" = alloca i32*
  %".50" = bitcast i8* %"a" to i32*
  store i32* %".50", i32** %"p"
  ;  Source: p
  %"p.1" = load i32*, i32** %"p"
  %"deref_load" = load i32, i32* %"p.1"
  ;  Source: b
  %"b.7" = load i32, i32* %"b"
  ;  Source: *p=b;
  store i32 %"b.7", i32* %"p.1"
  ;  Source: return0;
  ret i32 0
}
