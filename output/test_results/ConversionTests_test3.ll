; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: inta=5;
  store i32 5, i32* %"a"
  %"b" = alloca i32*
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: &a
  ;  Source: int*b=&a;
  store i32* %"a", i32** %"b"
  %"c" = alloca i32**
  ;  Source: b
  %"b.1" = load i32*, i32** %"b"
  ;  Source: &b
  ;  Source: int**c=&b;
  store i32** %"b", i32*** %"c"
  %"d" = alloca float**
  ;  Source: c
  %"c.1" = load i32**, i32*** %"c"
  ;  Source: float**d=c;
  %".14" = bitcast i32** %"c.1" to float**
  store float** %".14", float*** %"d"
  %"e" = alloca i8**
  ;  Source: c
  %"c.2" = load i32**, i32*** %"c"
  ;  Source: char**e=c;
  %".18" = bitcast i32** %"c.2" to i8**
  store i8** %".18", i8*** %"e"
  %"f" = alloca i32**
  ;  Source: c
  %"c.3" = load i32**, i32*** %"c"
  ;  Source: int**f=c;
  store i32** %"c.3", i32*** %"f"
  %"g" = alloca i32***
  ;  Source: c
  %"c.4" = load i32**, i32*** %"c"
  ;  Source: int***g=c;
  %".25" = bitcast i32** %"c.4" to i32***
  store i32*** %".25", i32**** %"g"
  ;  Source: return0;
  ret i32 0
}
