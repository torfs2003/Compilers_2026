; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: constintx=5;
  store i32 5, i32* %"x"
  %"f" = alloca float
  ;  Source: constfloatf=0.5487;
  store float 0x3fe18ef340000000, float* %"f"
  %"y" = alloca i32
  ;  Source: constinty=x*35*-5;
  store i32 -875, i32* %"y"
  %"z" = alloca float
  ;  Source: constfloatz=f*f*f;
  store float 0x3fc52535a0000000, float* %"z"
  ret i32 0
}
