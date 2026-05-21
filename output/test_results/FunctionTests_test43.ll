; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"f"(i32 %".1", float %".2", i8 %".3", i32 %".4", i32 %".5")
{
entry:
  %"a" = alloca i32
  store i32 %".1", i32* %"a"
  %"b" = alloca float
  store float %".2", float* %"b"
  %"c" = alloca i8
  store i8 %".3", i8* %"c"
  %"a.1" = alloca i32
  store i32 %".4", i32* %"a.1"
  %"b.1" = alloca i32
  store i32 %".5", i32* %"b.1"
  ;  Source: return0;
  ret i32 0
}

define i32 @"main"()
{
entry:
  ;  Source: return0;
  ret i32 0
}
