; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"f" = alloca float
  store float 0x40091eb860000000, float* %"f"
  %"pf" = alloca float*
  store float* %"f", float** %"pf"
  %"ppf" = alloca float**
  store float** %"pf", float*** %"ppf"
  %"pi" = alloca i32*
  %"ppf.1" = load float**, float*** %"ppf"
  %".5" = bitcast float** %"ppf.1" to i32*
  store i32* %".5", i32** %"pi"
  %"result" = alloca i32
  %"pi.1" = load i32*, i32** %"pi"
  %"deref_load" = load i32, i32* %"pi.1"
  %".7" = add i32 %"deref_load", 1
  store i32 %".7", i32* %"result"
  ret i32 0
}
