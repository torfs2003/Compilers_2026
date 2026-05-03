; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define i32 @"f"(i32 %".1", i32 %".2")
{
entry:
  %"a" = alloca i32
  store i32 %".1", i32* %"a"
  %"a.1" = alloca i32
  store i32 %".2", i32* %"a.1"
  ;  Source: return0;
  ret i32 0
}

define i32 @"main"()
{
entry:
  ;  Source: return0;
  ret i32 0
}
