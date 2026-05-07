; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx=5;
  store i32 5, i32* %"x"
  %"c" = alloca i8
  ;  Source: charc='a';
  store i8 97, i8* %"c"
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: x+c;
  %".9" = sext i8 %"c.1" to i32
  %".10" = add i32 %"x.1", %".9"
  ;  Source: return1;
  ret i32 1
}
