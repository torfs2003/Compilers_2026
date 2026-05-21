; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca i8
  %".2" = trunc i32 5 to i8
  store i8 %".2", i8* %"a"
  %"b" = alloca i32
  %"a_load" = load i8, i8* %"a"
  %".4" = sext i8 %"a_load" to i32
  store i32 %".4", i32* %"b"
  %"c" = alloca float
  %"b_load" = load i32, i32* %"b"
  %".6" = sitofp i32 %"b_load" to float
  store float %".6", float* %"c"
  %"d" = alloca i8*
  %".8" = bitcast float* %"c" to i8*
  store i8* %".8", i8** %"d"
  ;  Source: return0;
  ret i32 0
}
