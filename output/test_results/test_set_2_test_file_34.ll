; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca [2 x i32]
  ;  Source: inta[2];
  %"b" = alloca [2 x i32]
  ;  Source: intb[2];
  ;  Source: a
  ;  Source: b
  ;  Source: a==b;
  %".7" = ptrtoint [2 x i32]* %"a" to i32
  %".8" = ptrtoint [2 x i32]* %"b" to i32
  %".9" = icmp eq i32 %".7", %".8"
  %".10" = zext i1 %".9" to i32
  ;  Source: return1;
  ret i32 1
}
