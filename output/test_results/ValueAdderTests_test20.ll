; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: constintx=1;
  store i32 1, i32* %"x"
  %"y" = alloca i32
  ;  Source: inty=x;
  store i32 1, i32* %"y"
  ;  Source: while(x){y++;if(y>3){break;}}
  br label %"while.cond"
while.cond:
  %"whilecond" = icmp ne i32 1, 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"y.1" = load i32, i32* %"y"
  %".9" = load i32, i32* %"y"
  %".10" = add i32 %".9", 1
  store i32 %".10", i32* %"y"
  %"y.2" = load i32, i32* %"y"
  %".12" = icmp sgt i32 %"y.2", 3
  %".13" = zext i1 %".12" to i32
  %"ifcond" = icmp ne i32 %".13", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
while.end:
  ;  Source: return0;
  ret i32 0
if.then:
  br label %"while.end"
if.end:
  br label %"while.cond"
}
