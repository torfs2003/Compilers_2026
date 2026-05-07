; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: inta=5;
  store i32 5, i32* %"a"
  %"b" = alloca i32*
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: &a
  ;  Source: int*b=&a;
  store i32* %"a", i32** %"b"
  %"c" = alloca i32
  ;  Source: b
  %"b.1" = load i32*, i32** %"b"
  %"deref_load" = load i32, i32* %"b.1"
  ;  Source: *b+5.3
  %".10" = sitofp i32 %"deref_load" to float
  %".11" = fadd float %".10", 0x4015333340000000
  ;  Source: intc=*b+5.3;
  %".13" = fptosi float %".11" to i32
  store i32 %".13", i32* %"c"
  ;  Source: return0;
  ret i32 0
}
