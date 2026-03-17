; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  ;  Source: intx=-60;
  %"x" = alloca i32
  store i32 -60, i32* %"x"
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: int*some_pointer=&x;
  %"some_pointer" = alloca i32*
  store i32* %"x", i32** %"some_pointer"
  ;  Source: int**another_pointer;
  %"another_pointer" = alloca i32**
  ;  Source: int***triple_pointer;
  %"triple_pointer" = alloca i32***
  ;  Source: inty;
  %"y" = alloca i32
  ;  Source: some_pointer
  %"some_pointer.1" = load i32*, i32** %"some_pointer"
  %"deref_load" = load i32, i32* %"some_pointer.1"
  ;  Source: *some_pointer=53;
  store i32 53, i32* %"some_pointer.1"
  ;  Source: another_pointer
  %"another_pointer.1" = load i32**, i32*** %"another_pointer"
  ;  Source: some_pointer
  %"some_pointer.2" = load i32*, i32** %"some_pointer"
  ;  Source: &some_pointer
  ;  Source: another_pointer=&some_pointer;
  store i32** %"some_pointer", i32*** %"another_pointer"
  ;  Source: triple_pointer
  %"triple_pointer.1" = load i32***, i32**** %"triple_pointer"
  ;  Source: another_pointer
  %"another_pointer.2" = load i32**, i32*** %"another_pointer"
  ;  Source: &another_pointer
  ;  Source: triple_pointer=&another_pointer;
  store i32*** %"another_pointer", i32**** %"triple_pointer"
  ;  Source: y
  %"y.1" = load i32, i32* %"y"
  ;  Source: triple_pointer
  %"triple_pointer.2" = load i32***, i32**** %"triple_pointer"
  %"deref_load.1" = load i32**, i32*** %"triple_pointer.2"
  %"deref_load.2" = load i32*, i32** %"deref_load.1"
  ;  Source: ***triple_pointer
  %"deref_load.3" = load i32, i32* %"deref_load.2"
  ;  Source: y=***triple_pointer;
  store i32 %"deref_load.3", i32* %"y"
  ret i32 0
}
