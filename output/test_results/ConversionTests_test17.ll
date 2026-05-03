; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca float
  ;  Source: floatx=0.5;
  store float 0x3fe0000000000000, float* %"x"
  %"y" = alloca i32
  ;  Source: x
  %"x.1" = load float, float* %"x"
  ;  Source: inty=x;
  %".6" = fptosi float %"x.1" to i32
  store i32 %".6", i32* %"y"
  %"z" = alloca i32
  ;  Source: intz=0.5;
  %".9" = fptosi float 0x3fe0000000000000 to i32
  store i32 %".9", i32* %"z"
  ;  Source: return0;
  ret i32 0
}
