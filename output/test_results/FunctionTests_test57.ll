; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

define i32 @"add"(i32 %".1", i32 %".2")
{
entry:
  %"a" = alloca i32
  store i32 %".1", i32* %"a"
  %"b" = alloca i32
  store i32 %".2", i32* %"b"
  ;  Source: returna+b;
  %"a.1" = load i32, i32* %"a"
  %"b.1" = load i32, i32* %"b"
  %".7" = add i32 %"a.1", %"b.1"
  ret i32 %".7"
}

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx=5;
  store i32 5, i32* %"x"
  %"y" = alloca i32
  ;  Source: inty=10;
  store i32 10, i32* %"y"
  %"result" = alloca i32
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: y
  %"y.1" = load i32, i32* %"y"
  ;  Source: add(x,y)
  %".9" = call i32 @"add"(i32 %"x.1", i32 %"y.1")
  ;  Source: intresult=add(x,y);
  store i32 %".9", i32* %"result"
  ;  Source: return0;
  ret i32 0
}
