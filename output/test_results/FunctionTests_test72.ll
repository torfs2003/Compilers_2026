; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define void @"otherFunc"()
{
entry:
  %"x" = alloca i8
  ;  Source: charx;
  ret void
}

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx;
  ;  Source: return0;
  ret i32 0
}
