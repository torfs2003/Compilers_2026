; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

<<<<<<< HEAD
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

=======
>>>>>>> origin/optionals
define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx=-60;
  store i32 -60, i32* %"x"
  %"some_pointer" = alloca i32*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: int*some_pointer=&x;
  store i32* %"x", i32** %"some_pointer"
  ;  Source: some_pointer
  %"some_pointer.1" = load i32*, i32** %"some_pointer"
  %"deref_load" = load i32, i32* %"some_pointer.1"
  ;  Source: *some_pointer=53;
  store i32 53, i32* %"some_pointer.1"
  %"another_pointer" = alloca i32**
  ;  Source: some_pointer
  %"some_pointer.2" = load i32*, i32** %"some_pointer"
  ;  Source: &some_pointer
  ;  Source: int**another_pointer=&some_pointer;
  store i32** %"some_pointer", i32*** %"another_pointer"
  %"triple_pointer" = alloca i32***
  ;  Source: another_pointer
  %"another_pointer.1" = load i32**, i32*** %"another_pointer"
  ;  Source: &another_pointer
  ;  Source: int***triple_pointer=&another_pointer;
  store i32*** %"another_pointer", i32**** %"triple_pointer"
  %"y" = alloca i32
  ;  Source: triple_pointer
  %"triple_pointer.1" = load i32***, i32**** %"triple_pointer"
  %"deref_load.1" = load i32**, i32*** %"triple_pointer.1"
  %"deref_load.2" = load i32*, i32** %"deref_load.1"
  ;  Source: ***triple_pointer
  %"deref_load.3" = load i32, i32* %"deref_load.2"
  ;  Source: inty=***triple_pointer;
  store i32 %"deref_load.3", i32* %"y"
  ret i32 0
}
