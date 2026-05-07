; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 0, i32* %"a"
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: a=0;
  store i32 0, i32* %"a"
  ;  Source: if(a){return0;}else{if(a){return0;}}
  %"a.2" = load i32, i32* %"a"
  %"ifcond" = icmp ne i32 %"a.2", 0
  br i1 %"ifcond", label %"if.then", label %"if.else"
if.then:
  ret i32 0
if.end:
  ret i32 0
if.else:
  %"a.3" = load i32, i32* %"a"
  %"ifcond.1" = icmp ne i32 %"a.3", 0
  br i1 %"ifcond.1", label %"if.then.1", label %"if.end.1"
if.then.1:
  ret i32 0
if.end.1:
  br label %"if.end"
}
