; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: x
  %"x_load" = load i32, i32* %"x"
  ;  Source: 5+'a'
  %".4" = sext i8 97 to i32
  %".5" = add i32 5, %".4"
  ;  Source: x=5+'a';
  store i32 %".5", i32* %"x"
  ;  Source: x
  %"x_load.1" = load i32, i32* %"x"
  ;  Source: 5-'a'
  %".10" = sext i8 97 to i32
  %".11" = sub i32 5, %".10"
  ;  Source: x=5-'a';
  store i32 %".11", i32* %"x"
  ;  Source: x
  %"x_load.2" = load i32, i32* %"x"
  ;  Source: 5*'a'
  %".16" = sext i8 97 to i32
  %".17" = mul i32 5, %".16"
  ;  Source: x=5*'a';
  store i32 %".17", i32* %"x"
  ;  Source: x
  %"x_load.3" = load i32, i32* %"x"
  ;  Source: 5/'a'
  %".22" = sext i8 97 to i32
  %".23" = sdiv i32 5, %".22"
  ;  Source: x=5/'a';
  store i32 %".23", i32* %"x"
  ;  Source: return0;
  ret i32 0
}
