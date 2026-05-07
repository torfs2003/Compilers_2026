; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca float
  store float 0x3fdea7ac80000000, float* %"x"
  %"y" = alloca float
  store float 0x4154f0cac0000000, float* %"y"
  %"f" = alloca float
  store float 0x4099d80000000000, float* %"f"
  %"z" = alloca float
  store float              0x0, float* %"z"
  ;  Source: z
  %"z.1" = load float, float* %"z"
  ;  Source: z=-565.21547;
  store float 0xc081a9b940000000, float* %"z"
  ret i32 0
}
