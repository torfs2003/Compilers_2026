; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"c" = alloca i8
  store i8 97, i8* %"c"
  %"p1" = alloca i8*
  store i8* %"c", i8** %"p1"
  %"p2" = alloca i8**
  store i8** %"p1", i8*** %"p2"
  %"mod_p2" = alloca i8**
  %"p2_load" = load i8**, i8*** %"p2"
  store i8** %"p2_load", i8*** %"mod_p2"
  ;  Source: mod_p2
  %"mod_p2_load" = load i8**, i8*** %"mod_p2"
  %"deref_load" = load i8*, i8** %"mod_p2_load"
  %"deref_load.1" = load i8, i8* %"deref_load"
  ;  Source: **mod_p2='b';
  store i8 98, i8* %"deref_load"
  ret i32 0
}
