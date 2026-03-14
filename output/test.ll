; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  ;  Source: constintx=5;
  %"x" = alloca i32
  store i32 5, i32* %"x"
  ;  Source: constfloatf=0.5487;
  %"f" = alloca float
  store float 0x3fe18ef340000000, float* %"f"
  ;  Source: constinty=x*35*-5;
  %"y" = alloca i32
  store i32 -875, i32* %"y"
  ;  Source: constfloatz=f*f*f;
  %"z" = alloca float
  store float 0x3fc52535a0000000, float* %"z"
  ret i32 0
}
