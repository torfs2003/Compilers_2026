; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
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
  %"decay_left" = getelementptr [2 x i32], [2 x i32]* %"a", i32 0, i32 0
  %"decay_right" = getelementptr [2 x i32], [2 x i32]* %"b", i32 0, i32 0
  %".7" = ptrtoint i32* %"decay_left" to i32
  %".8" = ptrtoint i32* %"decay_right" to i32
  %".9" = icmp eq i32 %".7", %".8"
  %".10" = zext i1 %".9" to i32
  ;  Source: return1;
  ret i32 1
}
