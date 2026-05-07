; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"sum" = alloca i32
  ;  Source: intsum=0;
  store i32 0, i32* %"sum"
  %"i" = alloca i32
  ;  Source: inti;
  ;  Source: i
  %"i.1" = load i32, i32* %"i"
  ;  Source: i=0
  store i32 0, i32* %"i"
  br label %"while.cond"
while.cond:
  %"i.2" = load i32, i32* %"i"
  %".9" = icmp slt i32 %"i.2", 5
  %".10" = zext i1 %".9" to i32
  %"whilecond" = icmp ne i32 %".10", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"sum.1" = load i32, i32* %"sum"
  %"i.3" = load i32, i32* %"i"
  %".12" = add i32 %"sum.1", %"i.3"
  %"sum.2" = load i32, i32* %"sum"
  store i32 %".12", i32* %"sum"
  %"i.4" = load i32, i32* %"i"
  %".14" = add i32 %"i.4", 1
  %"i.5" = load i32, i32* %"i"
  store i32 %".14", i32* %"i"
  br label %"while.cond"
while.end:
  ;  Source: returnsum;
  %"sum.3" = load i32, i32* %"sum"
  ret i32 %"sum.3"
}
