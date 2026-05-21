; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 0, i32* %"x"
  %"y" = alloca float
  %".3" = sitofp i32 16 to float
  store float %".3", float* %"y"
  ;  Source: y
  %"y_load" = load float, float* %"y"
  ;  Source: y
  %"y_load.1" = load float, float* %"y"
  ;  Source: x+y
  %".8" = sitofp i32 0 to float
  %".9" = fadd float %".8", %"y_load.1"
  ;  Source: y=x+y;
  store float %".9", float* %"y"
  %"z" = alloca i32
  %"flt_ptr" = alloca float*
  store float* %"y", float** %"flt_ptr"
  %"ch" = alloca i8
  store i8 120, i8* %"ch"
  %"ptr_to_int" = alloca i32*
  store i32* %"z", i32** %"ptr_to_int"
  ;  Source: ptr_to_int
  %"ptr_to_int_load" = load i32*, i32** %"ptr_to_int"
  ;  Source: x
  ;  Source: &x
  ;  Source: ptr_to_int=&x;
  store i32* %"x", i32** %"ptr_to_int"
  ;  Source: ptr_to_int
  %"ptr_to_int_load.1" = load i32*, i32** %"ptr_to_int"
  %"deref_load" = load i32, i32* %"ptr_to_int_load.1"
  ;  User Comment: // this is allowed. The pointer now points to variable x
  ;  Source: *ptr_to_int=33;
  store i32 33, i32* %"ptr_to_int_load.1"
  ;  User Comment: // this is NOT allowed!
  ;  Source: return0;
  ret i32 0
}
