; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 0, i32* %"a"
  ;  Source: if(a){return0;}else{}
  %"a.1" = load i32, i32* %"a"
  %"ifcond" = icmp ne i32 %"a.1", 0
  br i1 %"ifcond", label %"if.then", label %"if.else"
if.then:
  ret i32 0
if.end:
  ret i32 0
if.else:
  br label %"if.end"
}
