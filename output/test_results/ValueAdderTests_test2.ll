; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: inta=1;
  store i32 1, i32* %"a"
  %"b" = alloca i32
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: intb=a;
  store i32 %"a.1", i32* %"b"
  %"c" = alloca i32
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: a+1
  %".9" = add i32 %"a.2", 1
  ;  Source: intc=a+1;
  store i32 %".9", i32* %"c"
  ;  Source: return0;
  ret i32 0
}
