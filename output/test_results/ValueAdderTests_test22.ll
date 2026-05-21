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
  %"i_load" = load i32, i32* %"i"
  ;  Source: i=0
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i_load.1" = load i32, i32* %"i"
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
  %"whilecond.1" = icmp ne i32 1, 0
  br i1 %"whilecond.1", label %"while.body.1", label %"while.end.1"
while.body.1:
  %"i_load.2" = load i32, i32* %"i"
  %".13" = icmp sgt i32 %"i_load.2", 5
  %".14" = zext i1 %".13" to i32
  %"ifcond" = icmp ne i32 %".14", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
while.end.1:
  br label %"while.cond"
if.then:
  ret i32 0
if.end:
  br label %"while.cond.1"
}
