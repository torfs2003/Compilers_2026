; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  ;  Source: intinteger=5;
  %"integer" = alloca i32
  store i32 5, i32* %"integer"
  ;  Source: integer
  %"integer.1" = load i32, i32* %"integer"
  ;  Source: &integer
  ;  Source: int*int_ptr=&integer;
  %"int_ptr" = alloca i32*
  store i32* %"integer", i32** %"int_ptr"
  ;  Source: int_ptr
  %"int_ptr.1" = load i32*, i32** %"int_ptr"
  ;  Source: &int_ptr
  ;  Source: int**ptr_ptr=&int_ptr;
  %"ptr_ptr" = alloca i32**
  store i32** %"int_ptr", i32*** %"ptr_ptr"
  ;  Source: ptr_ptr
  %"ptr_ptr.1" = load i32**, i32*** %"ptr_ptr"
  ;  Source: int**another_pointer=ptr_ptr;
  %"another_pointer" = alloca i32**
  store i32** %"ptr_ptr.1", i32*** %"another_pointer"
  ;  Source: integer
  %"integer.2" = load i32, i32* %"integer"
  ;  Source: integer+5
  %".17" = add i32 %"integer.2", 5
  ;  Source: intz=integer+5;
  %"z" = alloca i32
  store i32 %".17", i32* %"z"
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  ;  Source: &z
  ;  Source: int*pointer=&z;
  %"pointer" = alloca i32*
  store i32* %"z", i32** %"pointer"
  ;  Source: pointer
  %"pointer.1" = load i32*, i32** %"pointer"
  ;  Source: *pointer
  %"deref_load" = load i32, i32* %"pointer.1"
  ;  Source: intx=*pointer;
  %"x" = alloca i32
  store i32 %"deref_load", i32* %"x"
  ;  Source: int_ptr
  %"int_ptr.2" = load i32*, i32** %"int_ptr"
  ;  Source: &int_ptr
  ;  Source: int**x_ptr=&int_ptr;
  %"x_ptr" = alloca i32**
  store i32** %"int_ptr", i32*** %"x_ptr"
  ;  Source: int_ptr
  %"int_ptr.3" = load i32*, i32** %"int_ptr"
  ;  Source: z
  %"z.2" = load i32, i32* %"z"
  ;  Source: &z
  ;  Source: int_ptr=&z;
  store i32* %"z", i32** %"int_ptr"
  ret i32 0
}
