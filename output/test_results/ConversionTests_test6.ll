; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 5, i32* %"a"
  %"b" = alloca i8
  %"a.1" = load i32, i32* %"a"
  %".3" = trunc i32 %"a.1" to i8
  store i8 %".3", i8* %"b"
  %"c" = alloca i8*
  %".5" = bitcast i32* %"a" to i8*
  store i8* %".5", i8** %"c"
  %"d" = alloca float**
  %".7" = bitcast i8** %"c" to float**
  store float** %".7", float*** %"d"
  ;  Source: return0;
  ret i32 0
}
