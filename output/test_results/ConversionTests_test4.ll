; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca i8
  ;  Source: chara=5;
  %".3" = trunc i32 5 to i8
  store i8 %".3", i8* %"a"
  %"b" = alloca i32
  ;  Source: a
  %"a.1" = load i8, i8* %"a"
  ;  Source: intb=a;
  %".7" = sext i8 %"a.1" to i32
  store i32 %".7", i32* %"b"
  %"c" = alloca float
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: floatc=b;
  %".11" = sitofp i32 %"b.1" to float
  store float %".11", float* %"c"
  %"d" = alloca i8*
  ;  Source: c
  %"c.1" = load float, float* %"c"
  ;  Source: &c
  ;  Source: char*d=&c;
  %".16" = bitcast float* %"c" to i8*
  store i8* %".16", i8** %"d"
  ;  Source: return0;
  ret i32 0
}
