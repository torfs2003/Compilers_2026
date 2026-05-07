; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"e" = alloca float
  %".2" = sitofp i32 4 to float
  store float %".2", float* %"e"
  %"f" = alloca i32*
  %".4" = bitcast float* %"e" to i32*
  store i32* %".4", i32** %"f"
  %"g" = alloca i32
  %"f.1" = load i32*, i32** %"f"
  %"deref_load" = load i32, i32* %"f.1"
  store i32 %"deref_load", i32* %"g"
  ;  Source: return0;
  ret i32 0
}
