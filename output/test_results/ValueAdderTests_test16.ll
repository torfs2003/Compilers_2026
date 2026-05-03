; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: constintx=1;
  store i32 1, i32* %"x"
  %"y" = alloca i32
  ;  Source: inty=x;
  store i32 1, i32* %"y"
  %"ptr" = alloca i32*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: int*ptr=&x;
  store i32* %"x", i32** %"ptr"
  %"z" = alloca i32
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: intz=x;
  store i32 %"x.2", i32* %"z"
  ;  Source: return0;
  ret i32 0
}
