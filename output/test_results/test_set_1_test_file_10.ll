; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"number" = alloca i32
  store i32 -55, i32* %"number"
  %"n" = alloca i32
  ;  Source: number
  %"number.1" = load i32, i32* %"number"
  ;  Source: number++;
  %".5" = load i32, i32* %"number"
  %".6" = add i32 %".5", 1
  store i32 %".6", i32* %"number"
  ;  Source: number
  %"number.2" = load i32, i32* %"number"
  ;  Source: number
  %"number.3" = load i32, i32* %"number"
  ;  Source: number++
  %".11" = load i32, i32* %"number"
  %".12" = add i32 %".11", 1
  store i32 %".12", i32* %"number"
  ;  Source: number=number++;
  store i32 %".11", i32* %"number"
  ;  Source: n
  %"n.1" = load i32, i32* %"n"
  ;  Source: number
  %"number.4" = load i32, i32* %"number"
  ;  Source: number++
  %".19" = load i32, i32* %"number"
  %".20" = add i32 %".19", 1
  store i32 %".20", i32* %"number"
  ;  Source: n=number++;
  store i32 %".19", i32* %"n"
  ;  Source: n
  %"n.2" = load i32, i32* %"n"
  ;  Source: n
  %"n.3" = load i32, i32* %"n"
  ;  Source: n
  %"n.4" = load i32, i32* %"n"
  ;  Source: n++
  %".28" = load i32, i32* %"n"
  %".29" = add i32 %".28", 1
  store i32 %".29", i32* %"n"
  ;  Source: n-n++
  %".32" = sub i32 %"n.3", %".28"
  ;  Source: n=n-n++;
  store i32 %".32", i32* %"n"
  ;  Source: n
  %"n.5" = load i32, i32* %"n"
  ;  Source: ++n;
  %".37" = load i32, i32* %"n"
  %".38" = add i32 %".37", 1
  store i32 %".38", i32* %"n"
  ret i32 0
}
