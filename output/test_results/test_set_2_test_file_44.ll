; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"p" = alloca i32*
  ;  Source: p
  %"p_load" = load i32*, i32** %"p"
  ;  Source: &5
  ;  Source: p=&5;
  ;  Source: return1;
  ret i32 1
}
