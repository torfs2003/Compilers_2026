; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"some_func"(i32 %".1", i32 %".2")
{
entry:
  %"x" = alloca i32
  store i32 %".1", i32* %"x"
  %"y" = alloca i32
  store i32 %".2", i32* %"y"
  ;  Source: returnx*y;
  %"x_load" = load i32, i32* %"x"
  %"y_load" = load i32, i32* %"y"
  %".7" = mul i32 %"x_load", %"y_load"
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
  %"x_load" = load i32, i32* %"x"
  store i32 %"x_load", i32* %"new_value"
  ;  Source: new_value
  %"new_value_load" = load i32, i32* %"new_value"
  ;  Source: new_value
  %"new_value_load.1" = load i32, i32* %"new_value"
  %".9" = add i32 %"new_value_load.1", 6467
  ;  Source: new_value+=6467;
  store i32 %".9", i32* %"new_value"
  ;  Source: if(y){returnnew_value*2;}
  %"y_load" = load i32, i32* %"y"
  %"ifcond" = icmp ne i32 %"y_load", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
if.then:
  %"new_value_load.2" = load i32, i32* %"new_value"
  %".14" = mul i32 %"new_value_load.2", 2
  ret i32 %".14"
if.end:
  ;  Source: returnnew_value;
  %"new_value_load.3" = load i32, i32* %"new_value"
  ret i32 %"new_value_load.3"
}

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  %".2" = call i32 @"some_func"(i32 5, i32 1)
  store i32 %".2", i32* %"x"
  %"y" = alloca i32
  %"x_load" = load i32, i32* %"x"
  %".4" = call i32 @"adjust_value"(i32 %"x_load", i32 0)
  store i32 %".4", i32* %"y"
  ret i32 0
}
