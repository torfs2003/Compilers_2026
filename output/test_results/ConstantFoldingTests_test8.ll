; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
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
  %".7" = or i32 %".5", 1
  ;  Source: intx=a+50||0+1;
  store i32 %".7", i32* %"x"
  %"b" = alloca i32
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  %".12" = add i32 %"a.2", %"x.1"
  ;  Source: a+x&&5-5
  %".14" = and i32 %".12", 0
  ;  Source: intb=a+x&&5-5;
  store i32 %".14", i32* %"b"
  %"c" = alloca i32
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  %".19" = add i32 %"a.3", %"x.2"
  ;  Source: 1&&a+x
  %".21" = and i32 1, %".19"
  ;  Source: intc=1&&a+x;
  store i32 %".21", i32* %"c"
  %"d" = alloca i32
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  %".25" = sdiv i32 %"c.1", 80
  ;  Source: 0||c/80
  %".27" = or i32 0, %".25"
  ;  Source: intd=0||c/80;
  store i32 %".27", i32* %"d"
  ;  Source: return0;
  ret i32 0
}
