; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 1, i32* %"x"
  ;  Source: while(x){x++;if(x==10){x=0;}}
  br label %"while.cond"
while.cond:
  %"x.1" = load i32, i32* %"x"
  %"whilecond" = icmp ne i32 %"x.1", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"x.2" = load i32, i32* %"x"
  %".6" = load i32, i32* %"x"
  %".7" = add i32 %".6", 1
  store i32 %".7", i32* %"x"
  %"x.3" = load i32, i32* %"x"
  %".9" = icmp eq i32 %"x.3", 10
  %".10" = zext i1 %".9" to i32
  %"ifcond" = icmp ne i32 %".10", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
while.end:
  ;  Source: return0;
  ret i32 0
if.then:
  %"x.4" = load i32, i32* %"x"
  store i32 0, i32* %"x"
  br label %"if.end"
if.end:
  br label %"while.cond"
}
