; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 5, i32* %"x"
  %"f" = alloca float
  store float 0x3fe18ef340000000, float* %"f"
  %"y" = alloca i32
  %"x.1" = load i32, i32* %"x"
  %".4" = mul i32 %"x.1", 35
  %".5" = mul i32 %".4", -5
  store i32 %".5", i32* %"y"
  %"z" = alloca float
  %"f.1" = load float, float* %"f"
  %"f.2" = load float, float* %"f"
  %".7" = fmul float %"f.1", %"f.2"
  %"f.3" = load float, float* %"f"
  %".8" = fmul float %".7", %"f.3"
  store float %".8", float* %"z"
  ret i32 0
}
