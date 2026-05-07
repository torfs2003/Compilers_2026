; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 5, i32* %"a"
  %"b" = alloca i32*
  store i32* %"a", i32** %"b"
  ;  Source: (b)
  %"b.1" = load i32*, i32** %"b"
  %"deref_load" = load i32, i32* %"b.1"
  ;  Source: *(b)=8;
  store i32 8, i32* %"b.1"
  ;  Source: return0;
  ret i32 0
}
