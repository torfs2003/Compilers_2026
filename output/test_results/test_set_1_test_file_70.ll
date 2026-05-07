; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

define i32 @"some_func"(i32 %".1", i32 %".2")
{
entry:
  %"x" = alloca i32
  store i32 %".1", i32* %"x"
  %"y" = alloca i32
  store i32 %".2", i32* %"y"
  ;  Source: if(y){returnx*2;}else{returnx<<4;}
  %"y.1" = load i32, i32* %"y"
  %"ifcond" = icmp ne i32 %"y.1", 0
  br i1 %"ifcond", label %"if.then", label %"if.else"
if.then:
  %"x.1" = load i32, i32* %"x"
  %".8" = mul i32 %"x.1", 2
  ret i32 %".8"
if.end:
  ret i32 0
if.else:
  %"x.2" = load i32, i32* %"x"
  %".10" = shl i32 %"x.2", 4
  ret i32 %".10"
}

define i32 @"main"()
{
entry:
  ;  Source: return0;
  ret i32 0
}
