; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 0, i32* %"a"
  ;  Source: a
  %"a_load" = load i32, i32* %"a"
  ;  Source: a=0;
  store i32 0, i32* %"a"
  ;  Source: if(a){return0;}else{}
  %"a_load.1" = load i32, i32* %"a"
  %"ifcond" = icmp ne i32 %"a_load.1", 0
  br i1 %"ifcond", label %"if.then", label %"if.else"
if.then:
  ret i32 0
if.end:
  ;  Source: return0;
  ret i32 0
if.else:
  br label %"if.end"
}
