; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"multiply"(i32 %".1", i32 %".2")
{
entry:
  %"a" = alloca i32
  store i32 %".1", i32* %"a"
  %"b" = alloca i32
  store i32 %".2", i32* %"b"
  ;  Source: returna*b;
  %"a.1" = load i32, i32* %"a"
  %"b.1" = load i32, i32* %"b"
  %".7" = mul i32 %"a.1", %"b.1"
  ret i32 %".7"
}

define i32 @"main"()
{
entry:
  %"result" = alloca i32
  ;  Source: multiply(3,4)
  %".3" = call i32 @"multiply"(i32 3, i32 4)
  ;  Source: intresult=multiply(3,4);
  store i32 %".3", i32* %"result"
  ;  Source: return0;
  ret i32 0
}
