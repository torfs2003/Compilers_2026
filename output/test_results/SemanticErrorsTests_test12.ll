; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"z" = alloca i32
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  ;  Source: intz=z;
  store i32 %"z.1", i32* %"z"
  ;  Source: return0;
  ret i32 0
}
