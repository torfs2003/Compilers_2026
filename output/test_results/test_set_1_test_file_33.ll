; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"f" = alloca float
  ;  Source: floatf=9.457889;
  store float 0x4022ea7060000000, float* %"f"
  ;  Source: f
  %"f.1" = load float, float* %"f"
  ;  Source: &f=3217*54564;
  ret i32 0
}
