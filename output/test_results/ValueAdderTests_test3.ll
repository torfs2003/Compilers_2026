; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: inta=5;
  store i32 5, i32* %"a"
  %"b" = alloca float
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: 10+a
  %".6" = add i32 10, %"a.1"
  ;  Source: floatb=10+a;
  %".8" = sitofp i32 %".6" to float
  store float %".8", float* %"b"
  %"c" = alloca i32
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: b
  %"b.1" = load float, float* %"b"
  ;  Source: a+b
  %".13" = sitofp i32 %"a.2" to float
  %".14" = fadd float %".13", %"b.1"
  ;  Source: intc=a+b;
  %".16" = fptosi float %".14" to i32
  store i32 %".16", i32* %"c"
  %"d" = alloca i32
  ;  Source: intd;
  ;  Source: d
  %"d.1" = load i32, i32* %"d"
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  ;  Source: c+3
  %".22" = add i32 %"c.1", 3
  ;  Source: d=c+3;
  store i32 %".22", i32* %"d"
  ;  Source: return0;
  ret i32 0
}
