; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"i" = alloca i32
  %"j" = alloca i32
  store i32 5, i32* %"j"
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: i=0
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.2" = load i32, i32* %"i"
  %".7" = load i32, i32* %"i"
  %".8" = add i32 %".7", 1
  store i32 %".8", i32* %"i"
  %"whilecond" = icmp ne i32 %".7", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  br label %"while.cond.1"
while.end:
  ret i32 0
while.cond.1:
  %"j.1" = load i32, i32* %"j"
  %".12" = icmp eq i32 %"j.1", 5
  %".13" = zext i1 %".12" to i32
  %"whilecond.1" = icmp ne i32 %".13", 0
  br i1 %"whilecond.1", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"i.3" = load i32, i32* %"i"
  %"j.2" = load i32, i32* %"j"
  %".15" = icmp sgt i32 %"i.3", %"j.2"
  %".16" = zext i1 %".15" to i32
  %"ifcond" = icmp ne i32 %".16", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
while.end.1:
  br label %"while.cond"
if.then:
  ret i32 0
if.end:
  br label %"while.cond.1"
}
