; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: inta=5;
  store i32 5, i32* %"a"
  %"b" = alloca i8
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: charb=a;
  %".6" = trunc i32 %"a.1" to i8
  store i8 %".6", i8* %"b"
  ;  Source: return0;
  ret i32 0
}
