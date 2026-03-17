; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  ;  Source: intx=9;
  %"x" = alloca i32
  store i32 9, i32* %"x"
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: (x+3)
  %".6" = add i32 %"x.1", 3
  ;  Source: (x+3)=98721;
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: &x=6562;
  ret i32 0
}
