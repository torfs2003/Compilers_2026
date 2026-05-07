; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca float
  store float 0x3fe0000000000000, float* %"x"
  %"y" = alloca i32
  %"x.1" = load float, float* %"x"
  %".3" = fptosi float %"x.1" to i32
  store i32 %".3", i32* %"y"
  %"z" = alloca i32
  %".5" = fptosi float 0x3fe0000000000000 to i32
  store i32 %".5", i32* %"z"
  ;  Source: return0;
  ret i32 0
}
