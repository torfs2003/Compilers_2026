; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx=5;
  store i32 5, i32* %"x"
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: x--;
  %".6" = load i32, i32* %"x"
  %".7" = sub i32 %".6", 1
  store i32 %".7", i32* %"x"
  %"z" = alloca i32
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: x--
  %".11" = load i32, i32* %"x"
  %".12" = sub i32 %".11", 1
  store i32 %".12", i32* %"x"
  ;  Source: intz=x--;
  store i32 %".11", i32* %"z"
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: x
  %"x.4" = load i32, i32* %"x"
  ;  Source: x--
  %".19" = load i32, i32* %"x"
  %".20" = sub i32 %".19", 1
  store i32 %".20", i32* %"x"
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  ;  Source: z--
  %".24" = load i32, i32* %"z"
  %".25" = sub i32 %".24", 1
  store i32 %".25", i32* %"z"
  ;  Source: x--+z--
  %".28" = add i32 %".19", %".24"
  ;  Source: x=x--+z--;
  store i32 %".28", i32* %"x"
  ;  Source: x
  %"x.5" = load i32, i32* %"x"
  ;  Source: --x;
  %".33" = load i32, i32* %"x"
  %".34" = sub i32 %".33", 1
  store i32 %".34", i32* %"x"
  ret i32 0
}
