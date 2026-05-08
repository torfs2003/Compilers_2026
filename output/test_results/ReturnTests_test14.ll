; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 0, i32* %"a"
  ;  Source: if(a){}else{return0;}
  %"a_load" = load i32, i32* %"a"
  %"ifcond" = icmp ne i32 %"a_load", 0
  br i1 %"ifcond", label %"if.then", label %"if.else"
if.then:
  br label %"if.end"
if.end:
  ret i32 0
if.else:
  ret i32 0
}
