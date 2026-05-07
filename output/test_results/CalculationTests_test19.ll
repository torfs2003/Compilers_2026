; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"f" = alloca float
  store float 0x3fe93f7ce0000000, float* %"f"
  %"f_ptr" = alloca float*
  store float* %"f", float** %"f_ptr"
  %"non_const_f_ptr" = alloca float*
  %"f_ptr.1" = load float*, float** %"f_ptr"
  store float* %"f_ptr.1", float** %"non_const_f_ptr"
  ;  Source: non_const_f_ptr
  %"non_const_f_ptr.1" = load float*, float** %"non_const_f_ptr"
  %"deref_load" = load float, float* %"non_const_f_ptr.1"
  ;  Source: *non_const_f_ptr=3.1492;
  store float 0x4009318fc0000000, float* %"non_const_f_ptr.1"
  %".8" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: non_const_f_ptr
  %"non_const_f_ptr.2" = load float*, float** %"non_const_f_ptr"
  ;  Source: *non_const_f_ptr
  %"deref_load.1" = load float, float* %"non_const_f_ptr.2"
  ;  Source: printf("%f",*non_const_f_ptr);
  %".12" = fpext float %"deref_load.1" to double
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".8", double %".12")
  %".14" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: f
  %"f.1" = load float, float* %"f"
  ;  Source: printf("%f",f);
  %".17" = fpext float %"f.1" to double
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".14", double %".17")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%f\00"
@"str.1" = internal constant [3 x i8] c"%f\00"