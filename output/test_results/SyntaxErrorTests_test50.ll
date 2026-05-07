; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx;
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: 5+'a'
  %".5" = sext i8 97 to i32
  %".6" = add i32 5, %".5"
  ;  Source: x=5+'a';
  store i32 %".6", i32* %"x"
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: 5-'a'
  %".11" = sext i8 97 to i32
  %".12" = sub i32 5, %".11"
  ;  Source: x=5-'a';
  store i32 %".12", i32* %"x"
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: 5*'a'
  %".17" = sext i8 97 to i32
  %".18" = mul i32 5, %".17"
  ;  Source: x=5*'a';
  store i32 %".18", i32* %"x"
  ;  Source: x
  %"x.4" = load i32, i32* %"x"
  ;  Source: 5/'a'
  %".23" = sext i8 97 to i32
  %".24" = sdiv i32 5, %".23"
  ;  Source: x=5/'a';
  store i32 %".24", i32* %"x"
  ;  Source: return0;
  ret i32 0
}
