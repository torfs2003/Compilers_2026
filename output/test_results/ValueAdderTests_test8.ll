; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca i8
  ;  Source: constchara='a';
  store i8 97, i8* %"a"
  %"b" = alloca i32
  ;  Source: a
  %"a.1" = load i8, i8* %"a"
  ;  Source: constintb=a;
  %".6" = sext i8 %"a.1" to i32
  store i32 %".6", i32* %"b"
  %"c" = alloca float
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: constfloatc=b;
  %".10" = sitofp i32 %"b.1" to float
  store float %".10", float* %"c"
  %"d" = alloca i32
  ;  Source: c
  %"c.1" = load float, float* %"c"
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  %".14" = sitofp i32 %"b.2" to float
  %".15" = fadd float %"c.1", %".14"
  ;  Source: a
  %"a.2" = load i8, i8* %"a"
  ;  Source: c+b+a
  %".18" = sitofp i8 %"a.2" to float
  %".19" = fadd float %".15", %".18"
  ;  Source: constintd=c+b+a;
  %".21" = fptosi float %".19" to i32
  store i32 %".21", i32* %"d"
  %"e" = alloca i8
  ;  Source: d
  %"d.1" = load i32, i32* %"d"
  ;  Source: c
  %"c.2" = load float, float* %"c"
  %".25" = sitofp i32 %"d.1" to float
  %".26" = fadd float %".25", %"c.2"
  ;  Source: b
  %"b.3" = load i32, i32* %"b"
  %".28" = sitofp i32 %"b.3" to float
  %".29" = fadd float %".26", %".28"
  ;  Source: a
  %"a.3" = load i8, i8* %"a"
  ;  Source: d+c+b+a
  %".32" = sitofp i8 %"a.3" to float
  %".33" = fadd float %".29", %".32"
  ;  Source: constchare=d+c+b+a;
  %".35" = fptosi float %".33" to i8
  store i8 %".35", i8* %"e"
  %"f" = alloca float
  ;  Source: e
  %"e.1" = load i8, i8* %"e"
  ;  Source: d
  %"d.2" = load i32, i32* %"d"
  %".39" = sext i8 %"e.1" to i32
  %".40" = add i32 %".39", %"d.2"
  ;  Source: c
  %"c.3" = load float, float* %"c"
  %".42" = sitofp i32 %".40" to float
  %".43" = fadd float %".42", %"c.3"
  ;  Source: b
  %"b.4" = load i32, i32* %"b"
  %".45" = sitofp i32 %"b.4" to float
  %".46" = fadd float %".43", %".45"
  ;  Source: a
  %"a.4" = load i8, i8* %"a"
  ;  Source: e+d+c+b+a
  %".49" = sitofp i8 %"a.4" to float
  %".50" = fadd float %".46", %".49"
  ;  Source: constfloatf=e+d+c+b+a;
  store float %".50", float* %"f"
  %"g" = alloca i32
  ;  Source: e
  %"e.2" = load i8, i8* %"e"
  ;  Source: d
  %"d.3" = load i32, i32* %"d"
  %".55" = sext i8 %"e.2" to i32
  %".56" = add i32 %".55", %"d.3"
  ;  Source: c
  %"c.4" = load float, float* %"c"
  %".58" = sitofp i32 %".56" to float
  %".59" = fadd float %".58", %"c.4"
  ;  Source: b
  %"b.5" = load i32, i32* %"b"
  %".61" = sitofp i32 %"b.5" to float
  %".62" = fadd float %".59", %".61"
  ;  Source: a
  %"a.5" = load i8, i8* %"a"
  %".64" = sitofp i8 %"a.5" to float
  %".65" = fadd float %".62", %".64"
  ;  Source: f
  %"f.1" = load float, float* %"f"
  ;  Source: e+d+c+b+a+f
  %".68" = fadd float %".65", %"f.1"
  ;  Source: constintg=e+d+c+b+a+f;
  %".70" = fptosi float %".68" to i32
  store i32 %".70", i32* %"g"
  %"h" = alloca i32
  ;  Source: g
  %"g.1" = load i32, i32* %"g"
  ;  Source: g%12
  %".74" = srem i32 %"g.1", 12
  ;  Source: constinth=g%12;
  store i32 %".74", i32* %"h"
  %"i" = alloca i32
  ;  Source: h
  %"h.1" = load i32, i32* %"h"
  ;  Source: g
  %"g.2" = load i32, i32* %"g"
  ;  Source: b
  %"b.6" = load i32, i32* %"b"
  %".80" = mul i32 %"g.2", %"b.6"
  ;  Source: e
  %"e.3" = load i8, i8* %"e"
  %".82" = sext i8 %"e.3" to i32
  %".83" = sdiv i32 %".80", %".82"
  ;  Source: h-g*b/e
  ;  Source: constinti=h-g*b/e;
  ret i32 0
}
