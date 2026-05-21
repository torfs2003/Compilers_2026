; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"c" = alloca i8
  store i8 10, i8* %"c"
  %"f" = alloca float
  store float 0x40408cccc0000000, float* %"f"
  %"final_line" = alloca float
  store float 0x4040ffdda0000000, float* %"final_line"
  ret i32 0
}
