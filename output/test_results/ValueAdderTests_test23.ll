; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

define i32 @"foo"()
{
entry:
  ;  Source: return4;
  ret i32 4
}

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: foo()
  %".3" = call i32 @"foo"()
  ;  Source: intx=foo();
  store i32 %".3", i32* %"x"
  %"y" = alloca i32
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: inty=x;
  store i32 %"x.1", i32* %"y"
  %"z" = alloca i32
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: intz=x;
  store i32 %"x.2", i32* %"z"
  ;  Source: return0;
  ret i32 0
}
