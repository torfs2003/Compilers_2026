; ModuleID = "cmm_module"
<<<<<<< HEAD
target triple = "x86_64-w64-windows-gnu"
=======
target triple = "x86_64-unknown-linux-gnu"
>>>>>>> origin/main
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: boolx=1;
  store i32 1, i32* %"x"
  %"y" = alloca i32
  ;  Source: booly=0;
  store i32 0, i32* %"y"
  %"z" = alloca i32
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: y
  %"y.1" = load i32, i32* %"y"
  ;  Source: x&&y
  %".9" = icmp ne i32 %"x.1", 0
  %".10" = icmp ne i32 %"y.1", 0
  %".11" = and i1 %".9", %".10"
  %".12" = zext i1 %".11" to i32
  ;  Source: intz=x&&y;
  store i32 %".12", i32* %"z"
  %"b" = alloca i32
  ;  Source: y
  %"y.2" = load i32, i32* %"y"
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  %".17" = mul i32 %"y.2", %"z.1"
  ;  Source: y*z*57809
  %".19" = mul i32 %".17", 57809
  ;  Source: boolb=y*z*57809;
  store i32 %".19", i32* %"b"
  ;  Source: return0;
  ret i32 0
}
