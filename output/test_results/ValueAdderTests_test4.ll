; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"f" = alloca float
  ;  Source: floatf=3.14;
  store float 0x40091eb860000000, float* %"f"
  %"pf" = alloca float*
  ;  Source: f
  %"f.1" = load float, float* %"f"
  ;  Source: &f
  ;  Source: constfloat*pf=&f;
  store float* %"f", float** %"pf"
  %"ppf" = alloca float**
  ;  Source: pf
  %"pf.1" = load float*, float** %"pf"
  ;  Source: &pf
  ;  Source: constfloat**ppf=&pf;
  store float** %"pf", float*** %"ppf"
  %"pi" = alloca i32*
  ;  Source: ppf
  %"ppf.1" = load float**, float*** %"ppf"
  ;  Source: (int*)ppf
  %".14" = ptrtoint float** %"ppf.1" to i32
  ;  Source: int*pi=(int*)ppf;
  %".16" = inttoptr i32 %".14" to i32*
  store i32* %".16", i32** %"pi"
  %"result" = alloca i32
  ;  Source: pi
  %"pi.1" = load i32*, i32** %"pi"
  %"deref_load" = load i32, i32* %"pi.1"
  ;  Source: *pi+1
  %".20" = add i32 %"deref_load", 1
  ;  Source: intresult=*pi+1;
  store i32 %".20", i32* %"result"
  ret i32 0
}
