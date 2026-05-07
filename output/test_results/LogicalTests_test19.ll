; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"b" = alloca i32
  ;  Source: intb=5;
  store i32 5, i32* %"b"
  %"a" = alloca i32
  ;  Source: inta=3;
  store i32 3, i32* %"a"
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: a||b;
  %".9" = icmp ne i32 %"a.1", 0
  %".10" = icmp ne i32 %"b.1", 0
  %".11" = or i1 %".9", %".10"
  %".12" = zext i1 %".11" to i32
  ;  Source: return0;
  ret i32 0
}
