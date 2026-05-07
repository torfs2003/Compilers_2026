; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca [2 x i32]
  %"b" = alloca [2 x i32]
  ;  Source: a
  ;  Source: b
  ;  Source: a==b;
  %".5" = ptrtoint [2 x i32]* %"a" to i32
  %".6" = ptrtoint [2 x i32]* %"b" to i32
  %".7" = icmp eq i32 %".5", %".6"
  %".8" = zext i1 %".7" to i32
  ;  Source: return1;
  ret i32 1
}
