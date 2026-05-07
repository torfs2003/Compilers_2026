; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca i8
  ;  Source: chara='a';
  store i8 97, i8* %"a"
  %"b" = alloca i32
  ;  Source: a
  %"a.1" = load i8, i8* %"a"
  ;  Source: (int)a
  %".6" = sext i8 %"a.1" to i32
  ;  Source: intb=(int)a;
  store i32 %".6", i32* %"b"
  %"c" = alloca float
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: (float)b
  %".11" = sitofp i32 %"b.1" to float
  ;  Source: floatc=(float)b;
  store float %".11", float* %"c"
  %"d" = alloca float
  ;  Source: floatd=6.7;
  store float 0x401accccc0000000, float* %"d"
  %"e" = alloca i32
  ;  Source: inte=5;
  store i32 5, i32* %"e"
  %"q" = alloca i8
  ;  Source: charq='b';
  store i8 98, i8* %"q"
  %"g" = alloca i8
  ;  Source: a
  %"a.2" = load i8, i8* %"a"
  ;  Source: c
  %"c.1" = load float, float* %"c"
  %".22" = sitofp i8 %"a.2" to float
  %".23" = fadd float %".22", %"c.1"
  ;  Source: e
  %"e.1" = load i32, i32* %"e"
  %".25" = sitofp i32 %"e.1" to float
  %".26" = fadd float %".23", %".25"
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  %".28" = sitofp i32 %"b.2" to float
  %".29" = fadd float %".26", %".28"
  ;  Source: e
  %"e.2" = load i32, i32* %"e"
  %".31" = sitofp i32 %"e.2" to float
  %".32" = fadd float %".29", %".31"
  ;  Source: q
  %"q.1" = load i8, i8* %"q"
  %".34" = sitofp i8 %"q.1" to float
  %".35" = fadd float %".32", %".34"
  ;  Source: d
  %"d.1" = load float, float* %"d"
  ;  Source: a+c+e+b+e+q+d
  %".38" = fadd float %".35", %"d.1"
  ;  Source: charg=a+c+e+b+e+q+d;
  %".40" = fptosi float %".38" to i8
  store i8 %".40", i8* %"g"
  ;  Source: return0;
  ret i32 0
}
