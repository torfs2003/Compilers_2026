; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca i8
  store i8 97, i8* %"a"
  %"b" = alloca i32
  %".3" = sext i8 97 to i32
  store i32 %".3", i32* %"b"
  %"c" = alloca float
  %".5" = sitofp i8 97 to float
  store float %".5", float* %"c"
  %"d" = alloca i32
  %".7" = add i8 97, 97
  %".8" = add i8 %".7", 97
  %".9" = sext i8 %".8" to i32
  store i32 %".9", i32* %"d"
  %"e" = alloca i8
  %".11" = sext i8 97 to i32
  %".12" = add i32 %".9", %".11"
  %".13" = sext i8 97 to i32
  %".14" = add i32 %".12", %".13"
  %".15" = sext i8 97 to i32
  %".16" = add i32 %".14", %".15"
  %".17" = trunc i32 %".16" to i8
  store i8 %".17", i8* %"e"
  %"f" = alloca float
  %".19" = sext i8 %".17" to i32
  %".20" = add i32 %".19", %".9"
  %".21" = sext i8 97 to i32
  %".22" = add i32 %".20", %".21"
  %".23" = sext i8 97 to i32
  %".24" = add i32 %".22", %".23"
  %".25" = sext i8 97 to i32
  %".26" = add i32 %".24", %".25"
  %".27" = sitofp i32 %".26" to float
  store float %".27", float* %"f"
  %"g" = alloca i32
  %".29" = sext i8 %".17" to i32
  %".30" = add i32 %".29", %".9"
  %".31" = sext i8 97 to i32
  %".32" = add i32 %".30", %".31"
  %".33" = sext i8 97 to i32
  %".34" = add i32 %".32", %".33"
  %".35" = sext i8 97 to i32
  %".36" = add i32 %".34", %".35"
  %".37" = sitofp i32 %".36" to float
  %".38" = fadd float %".37", %".27"
  %".39" = fptosi float %".38" to i32
  store i32 %".39", i32* %"g"
  %"h" = alloca i32
  %".41" = srem i32 %".39", 12
  store i32 %".41", i32* %"h"
  %"i" = alloca i32
  %".43" = sext i8 97 to i32
  %".44" = mul i32 %".39", %".43"
  %".45" = sext i8 %".17" to i32
  %".46" = sdiv i32 %".44", %".45"
  %".47" = sub i32 %".41", %".46"
  store i32 %".47", i32* %"i"
  %"z" = alloca float
  store float 0x3feca8f1a0000000, float* %"z"
  %"y" = alloca i8
  store i8 97, i8* %"y"
  %"p" = alloca i32*
  %".51" = bitcast i8* %"a" to i32*
  store i32* %".51", i32** %"p"
  ;  Source: p
  %"p_load" = load i32*, i32** %"p"
  %"deref_load" = load i32, i32* %"p_load"
  ;  Source: *p=b;
  %".55" = sext i8 97 to i32
  store i32 %".55", i32* %"p_load"
  ;  Source: return0;
  ret i32 0
}
