; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 5, i32* %"a"
  %"b" = alloca i32*
  store i32* %"a", i32** %"b"
  %"c" = alloca i32**
  store i32** %"b", i32*** %"c"
  %"d" = alloca float**
  %"c.1" = load i32**, i32*** %"c"
  %".5" = bitcast i32** %"c.1" to float**
  store float** %".5", float*** %"d"
  %"e" = alloca i8**
  %"c.2" = load i32**, i32*** %"c"
  %".7" = bitcast i32** %"c.2" to i8**
  store i8** %".7", i8*** %"e"
  %"f" = alloca i32**
  %"c.3" = load i32**, i32*** %"c"
  store i32** %"c.3", i32*** %"f"
  %"g" = alloca i32***
  %"c.4" = load i32**, i32*** %"c"
  %".10" = bitcast i32** %"c.4" to i32***
  store i32*** %".10", i32**** %"g"
  ;  Source: return0;
  ret i32 0
}
