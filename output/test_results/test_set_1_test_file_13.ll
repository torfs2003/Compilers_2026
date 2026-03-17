; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  ;  Source: floatx=0.478984;
  %"x" = alloca float
  store float 0x3fdea7ac80000000, float* %"x"
  ;  Source: floaty=5489451.245847;
  %"y" = alloca float
  store float 0x4154f0cac0000000, float* %"y"
  ;  Source: floatf=1654.0000;
  %"f" = alloca float
  store float 0x4099d80000000000, float* %"f"
  ;  Source: floatz=0000.00000;
  %"z" = alloca float
  store float              0x0, float* %"z"
  ;  Source: z
  %"z.1" = load float, float* %"z"
  ;  Source: z=-565.21547;
  store float 0xc081a9b940000000, float* %"z"
  ret i32 0
}
