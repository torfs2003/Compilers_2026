; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"v" = alloca float
  ;  Source: floatv=5.5;
  store float 0x4016000000000000, float* %"v"
  %"a" = alloca i32
  ;  Source: v
  %"v.1" = load float, float* %"v"
  ;  Source: inta=v;
  %".6" = fptosi float %"v.1" to i32
  store i32 %".6", i32* %"a"
  ;  Source: return0;
  ret i32 0
}
