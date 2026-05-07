; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  ;  Source: return0;
  ret i32 0
}

@"b" = internal global i32 3
define i32 @"foo"()
{
entry:
  ;  Source: return0;
  ret i32 0
}
