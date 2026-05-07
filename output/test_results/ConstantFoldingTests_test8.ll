; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: inta=15;
  store i32 15, i32* %"a"
  %"x" = alloca i32
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  %".5" = add i32 %"a.1", 50
  ;  Source: a+50||0+1
  %".7" = icmp ne i32 %".5", 0
  %".8" = icmp ne i32 1, 0
  %".9" = or i1 %".7", %".8"
  %".10" = zext i1 %".9" to i32
  ;  Source: intx=a+50||0+1;
  store i32 %".10", i32* %"x"
  %"b" = alloca i32
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  %".15" = add i32 %"a.2", %"x.1"
  ;  Source: a+x&&5-5
  %".17" = icmp ne i32 %".15", 0
  %".18" = icmp ne i32 0, 0
  %".19" = and i1 %".17", %".18"
  %".20" = zext i1 %".19" to i32
  ;  Source: intb=a+x&&5-5;
  store i32 %".20", i32* %"b"
  %"c" = alloca i32
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  %".25" = add i32 %"a.3", %"x.2"
  ;  Source: 1&&a+x
  %".27" = icmp ne i32 1, 0
  %".28" = icmp ne i32 %".25", 0
  %".29" = and i1 %".27", %".28"
  %".30" = zext i1 %".29" to i32
  ;  Source: intc=1&&a+x;
  store i32 %".30", i32* %"c"
  %"d" = alloca i32
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  %".34" = sdiv i32 %"c.1", 80
  ;  Source: 0||c/80
  %".36" = icmp ne i32 0, 0
  %".37" = icmp ne i32 %".34", 0
  %".38" = or i1 %".36", %".37"
  %".39" = zext i1 %".38" to i32
  ;  Source: intd=0||c/80;
  store i32 %".39", i32* %"d"
  ;  Source: return0;
  ret i32 0
}
