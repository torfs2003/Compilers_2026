; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  ;  Source: floatf=9.457889;
  %"f" = alloca float
  store float 0x4022ea7060000000, float* %"f"
  ;  Source: f
  %"f.1" = load float, float* %"f"
  ;  Source: 3217*54564
  %".6" = mul i32 3217, 54564
  ;  Source: &f=3217*54564;
  ret i32 0
}
