; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"v" = alloca float
  store float 0x4016000000000000, float* %"v"
  %"a" = alloca i32
  %"v.1" = load float, float* %"v"
  %".3" = fptosi float %"v.1" to i32
  store i32 %".3", i32* %"a"
  ;  Source: return0;
  ret i32 0
}
