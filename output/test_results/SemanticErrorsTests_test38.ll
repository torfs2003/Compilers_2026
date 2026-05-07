; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: constinta=5;
  store i32 5, i32* %"a"
  %"b" = alloca i32*
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: &a
  ;  Source: constint*b=&a;
  store i32* %"a", i32** %"b"
  ;  Source: b
  %"b.1" = load i32*, i32** %"b"
  ;  Source: (b+1)
  %".10" = getelementptr i32, i32* %"b.1", i32 1
  %"deref_load" = load i32, i32* %".10"
  ;  Source: *(b+1)=8;
  store i32 8, i32* %".10"
  ;  Source: return0;
  ret i32 0
}
