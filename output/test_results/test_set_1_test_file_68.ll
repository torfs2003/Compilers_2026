; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

define i32 @"some_func"(i32 %".1", i32 %".2")
{
entry:
  %"x" = alloca i32
  store i32 %".1", i32* %"x"
  %"y" = alloca i32
  store i32 %".2", i32* %"y"
  ;  Source: returnx*y;
  %"x.1" = load i32, i32* %"x"
  %"y.1" = load i32, i32* %"y"
  %".7" = mul i32 %"x.1", %"y.1"
  ret i32 %".7"
}

define i32 @"adjust_value"(i32 %".1", i32 %".2")
{
entry:
  %"x" = alloca i32
  store i32 %".1", i32* %"x"
  %"y" = alloca i32
  store i32 %".2", i32* %"y"
  %"new_value" = alloca i32
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: intnew_value=x;
  store i32 %"x.1", i32* %"new_value"
  ;  Source: new_value
  %"new_value.1" = load i32, i32* %"new_value"
  ;  Source: new_value
  %"new_value.2" = load i32, i32* %"new_value"
  %".11" = add i32 %"new_value.2", 6467
  ;  Source: new_value+=6467;
  store i32 %".11", i32* %"new_value"
  ;  Source: if(y){returnnew_value*2;}
  %"y.1" = load i32, i32* %"y"
  %"ifcond" = icmp ne i32 %"y.1", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
if.then:
  %"new_value.3" = load i32, i32* %"new_value"
  %".16" = mul i32 %"new_value.3", 2
  ret i32 %".16"
if.end:
  ;  Source: returnnew_value;
  %"new_value.4" = load i32, i32* %"new_value"
  ret i32 %"new_value.4"
}

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: some_func(5,1)
  %".3" = call i32 @"some_func"(i32 5, i32 1)
  ;  Source: intx=some_func(5,1);
  store i32 %".3", i32* %"x"
  %"y" = alloca i32
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: adjust_value(x,0)
  %".8" = call i32 @"adjust_value"(i32 %"x.1", i32 0)
  ;  Source: inty=adjust_value(x,0);
  store i32 %".8", i32* %"y"
  ret i32 0
}
