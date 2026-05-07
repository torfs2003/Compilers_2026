; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 0, i32* %"x"
  %"y" = alloca float
  %"x.1" = load i32, i32* %"x"
  %".3" = mul i32 %"x.1", 2
  %"x.2" = load i32, i32* %"x"
  %".4" = add i32 2, %"x.2"
  %".5" = sdiv i32 %".3", %".4"
  %".6" = add i32 %".5", 16
  %".7" = sitofp i32 %".6" to float
  store float %".7", float* %"y"
  ;  Source: y
  %"y.1" = load float, float* %"y"
  ;  Source: x
  %"x.3" = load i32, i32* %"x"
  ;  Source: y
  %"y.2" = load float, float* %"y"
  ;  Source: x+y
  %".13" = sitofp i32 %"x.3" to float
  %".14" = fadd float %".13", %"y.2"
  ;  Source: y=x+y;
  store float %".14", float* %"y"
  %"z" = alloca i32
  %"flt_ptr" = alloca float*
  store float* %"y", float** %"flt_ptr"
  %"ch" = alloca i8
  store i8 120, i8* %"ch"
  %"ptr_to_int" = alloca i32*
  store i32* %"z", i32** %"ptr_to_int"
  ;  Source: ptr_to_int
  %"ptr_to_int.1" = load i32*, i32** %"ptr_to_int"
  ;  Source: x
  %"x.4" = load i32, i32* %"x"
  ;  Source: &x
  ;  Source: ptr_to_int=&x;
  store i32* %"x", i32** %"ptr_to_int"
  ;  Source: ptr_to_int
  %"ptr_to_int.2" = load i32*, i32** %"ptr_to_int"
  %"deref_load" = load i32, i32* %"ptr_to_int.2"
  ;  User Comment: // this is allowed. The pointer now points to variable x
  ;  Source: *ptr_to_int=33;
  store i32 33, i32* %"ptr_to_int.2"
  ;  User Comment: // this is NOT allowed!
  ;  Source: return0;
  ret i32 0
}
