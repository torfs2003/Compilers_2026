; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 5, i32* %"a"
  %"b" = alloca float
  %"a.1" = load i32, i32* %"a"
  %".3" = add i32 10, %"a.1"
  %".4" = sitofp i32 %".3" to float
  store float %".4", float* %"b"
  %"c" = alloca i32
  %"a.2" = load i32, i32* %"a"
  %"b.1" = load float, float* %"b"
  %".6" = sitofp i32 %"a.2" to float
  %".7" = fadd float %".6", %"b.1"
  %".8" = fptosi float %".7" to i32
  store i32 %".8", i32* %"c"
  %"d" = alloca i32
  ;  Source: d
  %"d.1" = load i32, i32* %"d"
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  ;  Source: c+3
  %".13" = add i32 %"c.1", 3
  ;  Source: d=c+3;
  store i32 %".13", i32* %"d"
  ;  Source: return0;
  ret i32 0
}
