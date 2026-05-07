; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"i" = alloca i32
  ;  Source: inti;
  %"j" = alloca i32
  ;  Source: constintj=5;
  store i32 5, i32* %"j"
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: i=0
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.2" = load i32, i32* %"i"
  %".9" = load i32, i32* %"i"
  %".10" = add i32 %".9", 1
  store i32 %".10", i32* %"i"
  %"whilecond" = icmp ne i32 %".9", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  br label %"while.cond.1"
while.end:
  ret i32 0
while.cond.1:
  %"j.1" = load i32, i32* %"j"
  %".14" = icmp eq i32 %"j.1", 5
  %".15" = zext i1 %".14" to i32
  %"whilecond.1" = icmp ne i32 %".15", 0
  br i1 %"whilecond.1", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"i.3" = load i32, i32* %"i"
  %"j.2" = load i32, i32* %"j"
  %".17" = icmp sgt i32 %"i.3", %"j.2"
  %".18" = zext i1 %".17" to i32
  %"ifcond" = icmp ne i32 %".18", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
while.end.1:
  br label %"while.cond"
if.then:
  ret i32 0
if.end:
  br label %"while.cond.1"
}
