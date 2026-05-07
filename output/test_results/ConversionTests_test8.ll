; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 5, i32* %"a"
  %"b" = alloca i32*
  store i32* %"a", i32** %"b"
  %"c" = alloca i32
  %"b.1" = load i32*, i32** %"b"
  %"deref_load" = load i32, i32* %"b.1"
  %".4" = sitofp i32 %"deref_load" to float
  %".5" = fadd float %".4", 0x4015333340000000
  %".6" = fptosi float %".5" to i32
  store i32 %".6", i32* %"c"
  ;  Source: return0;
  ret i32 0
}
