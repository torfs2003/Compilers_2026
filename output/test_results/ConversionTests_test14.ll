; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"b" = alloca i32
  ;  Source: intb=5;
  store i32 5, i32* %"b"
  %"c" = alloca i32
  ;  Source: intc=7;
  store i32 7, i32* %"c"
  %"d" = alloca i32
  ;  Source: intd=0;
  store i32 0, i32* %"d"
  %"a" = alloca i32
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  %".10" = icmp ne i32 %"b.1", 0
  %".11" = icmp ne i32 %"c.1", 0
  %".12" = and i1 %".10", %".11"
  %".13" = zext i1 %".12" to i32
  ;  Source: d
  %"d.1" = load i32, i32* %"d"
  ;  Source: (b&&c||d)
  %".16" = icmp ne i32 %".13", 0
  %".17" = icmp ne i32 %"d.1", 0
  %".18" = or i1 %".16", %".17"
  %".19" = zext i1 %".18" to i32
  ;  Source: inta=(b&&c||d);
  store i32 %".19", i32* %"a"
  ;  Source: return0;
  ret i32 0
}
