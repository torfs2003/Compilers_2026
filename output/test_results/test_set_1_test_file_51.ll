; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"main"()
{
entry:
  %"f" = alloca float
  store float 0x3fe93f7ce0000000, float* %"f"
  %"f_ptr" = alloca float*
  store float* %"f", float** %"f_ptr"
  %"non_const_f_ptr" = alloca float*
  %"f_ptr_load" = load float*, float** %"f_ptr"
  store float* %"f_ptr_load", float** %"non_const_f_ptr"
  ;  Source: non_const_f_ptr
  %"non_const_f_ptr_load" = load float*, float** %"non_const_f_ptr"
  %"deref_load" = load float, float* %"non_const_f_ptr_load"
  ;  Source: *non_const_f_ptr=3.1492;
  store float 0x4009318fc0000000, float* %"non_const_f_ptr_load"
  ret i32 0
}
