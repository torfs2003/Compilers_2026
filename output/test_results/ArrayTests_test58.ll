; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"b" = alloca i32
  ;  Source: constintb=5;
  store i32 5, i32* %"b"
  %"a" = alloca [3 x i32]
  ;  Source: inta[1+2];
  ;  Source: return0;
  ret i32 0
}
