; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: inta=5;
  store i32 5, i32* %"a"
  %"b" = alloca i8
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: charb=a;
  %".6" = trunc i32 %"a.1" to i8
  store i8 %".6", i8* %"b"
  %"c" = alloca i8*
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: &a
  ;  Source: char*c=&a;
  %".11" = bitcast i32* %"a" to i8*
  store i8* %".11", i8** %"c"
  %"d" = alloca float**
  ;  Source: c
  %"c.1" = load i8*, i8** %"c"
  ;  Source: &c
  ;  Source: float**d=&c;
  %".16" = bitcast i8** %"c" to float**
  store float** %".16", float*** %"d"
  ;  Source: return0;
  ret i32 0
}
