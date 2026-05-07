; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 1, i32* %"x"
  %"y" = alloca i32
  %"x.1" = load i32, i32* %"x"
  store i32 %"x.1", i32* %"y"
  ;  Source: while(x){y++;if(y>3){break;}}
  br label %"while.cond"
while.cond:
  %"x.2" = load i32, i32* %"x"
  %"whilecond" = icmp ne i32 %"x.2", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"y.1" = load i32, i32* %"y"
  %".7" = load i32, i32* %"y"
  %".8" = add i32 %".7", 1
  store i32 %".8", i32* %"y"
  %"y.2" = load i32, i32* %"y"
  %".10" = icmp sgt i32 %"y.2", 3
  %".11" = zext i1 %".10" to i32
  %"ifcond" = icmp ne i32 %".11", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
while.end:
  ;  Source: return0;
  ret i32 0
if.then:
  br label %"while.end"
if.end:
  br label %"while.cond"
}
