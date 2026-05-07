; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"K" = alloca i32
  ;  Source: appelK;
  ;  Source: K
  %"K.1" = load i32, i32* %"K"
  ;  Source: K++;
  %".5" = load i32, i32* %"K"
  %".6" = add i32 %".5", 1
  store i32 %".6", i32* %"K"
  ;  Source: K
  %"K.2" = load i32, i32* %"K"
  ;  Source: K=39-7;
  store i32 32, i32* %"K"
  %"z" = alloca i32
  ;  Source: K
  %"K.3" = load i32, i32* %"K"
  ;  Source: K+1
  %".13" = add i32 %"K.3", 1
  ;  Source: applez=K+1;
  store i32 %".13", i32* %"z"
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  ;  Source: (appel)z;
  ;  Source: return0;
  ret i32 0
}
