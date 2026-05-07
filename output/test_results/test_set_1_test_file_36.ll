; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"z" = alloca i32
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  ;  Source: intz=z;
  store i32 %"z.1", i32* %"z"
  ret i32 0
}
