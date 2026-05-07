; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"e" = alloca float
  ;  Source: constfloate=4;
  %".3" = sitofp i32 4 to float
  store float %".3", float* %"e"
  %"f" = alloca i32*
  ;  Source: e
  %"e.1" = load float, float* %"e"
  ;  Source: &e
  ;  Source: int*f=&e;
  %".8" = bitcast float* %"e" to i32*
  store i32* %".8", i32** %"f"
  %"g" = alloca i32
  ;  Source: f
  %"f.1" = load i32*, i32** %"f"
  ;  Source: *f
  %"deref_load" = load i32, i32* %"f.1"
  ;  Source: intg=*f;
  store i32 %"deref_load", i32* %"g"
  ;  Source: return0;
  ret i32 0
}
