; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"integer" = alloca i32
  store i32 5, i32* %"integer"
  %"int_ptr" = alloca i32*
  store i32* %"integer", i32** %"int_ptr"
  %"ptr_ptr" = alloca i32**
  store i32** %"int_ptr", i32*** %"ptr_ptr"
  %"another_pointer" = alloca i32**
  %"ptr_ptr.1" = load i32**, i32*** %"ptr_ptr"
  store i32** %"ptr_ptr.1", i32*** %"another_pointer"
  %"z" = alloca i32
  %"integer.1" = load i32, i32* %"integer"
  %".6" = add i32 %"integer.1", 5
  store i32 %".6", i32* %"z"
  %"pointer" = alloca i32*
  store i32* %"z", i32** %"pointer"
  %"x" = alloca i32
  %"pointer.1" = load i32*, i32** %"pointer"
  %"deref_load" = load i32, i32* %"pointer.1"
  store i32 %"deref_load", i32* %"x"
  %"x_ptr" = alloca i32**
  store i32** %"int_ptr", i32*** %"x_ptr"
  ;  Source: int_ptr
  %"int_ptr.1" = load i32*, i32** %"int_ptr"
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  ;  Source: &z
  ;  Source: int_ptr=&z;
  store i32* %"z", i32** %"int_ptr"
  ret i32 0
}
