; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"f" = alloca float*
  %".2" = inttoptr i32 5 to float*
  store float* %".2", float** %"f"
  ;  Source: return0;
  ret i32 0
}
