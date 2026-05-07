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
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f_ptr
  %"f_ptr.1" = load float*, float** %"f_ptr"
  ;  Source: *f_ptr
  %"deref_load" = load float, float* %"f_ptr.1"
  ;  Source: printf("%f",*f_ptr);
  %".8" = fpext float %"deref_load" to double
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".4", double %".8")
  %".10" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: f
  %"f.1" = load float, float* %"f"
  ;  Source: printf("%f",f);
  %".13" = fpext float %"f.1" to double
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".10", double %".13")
  %"non_const_f_ptr" = alloca float*
  %"f_ptr.2" = load float*, float** %"f_ptr"
  store float* %"f_ptr.2", float** %"non_const_f_ptr"
  %".16" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: non_const_f_ptr
  %"non_const_f_ptr.1" = load float*, float** %"non_const_f_ptr"
  ;  Source: *non_const_f_ptr
  %"deref_load.1" = load float, float* %"non_const_f_ptr.1"
  ;  Source: printf("%f",*non_const_f_ptr);
  %".20" = fpext float %"deref_load.1" to double
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".16", double %".20")
  ;  Source: non_const_f_ptr
  %"non_const_f_ptr.2" = load float*, float** %"non_const_f_ptr"
  %"deref_load.2" = load float, float* %"non_const_f_ptr.2"
  ;  Source: *non_const_f_ptr=3.1492;
  store float 0x4009318fc0000000, float* %"non_const_f_ptr.2"
  %".25" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: non_const_f_ptr
  %"non_const_f_ptr.3" = load float*, float** %"non_const_f_ptr"
  ;  Source: *non_const_f_ptr
  %"deref_load.3" = load float, float* %"non_const_f_ptr.3"
  ;  Source: printf("%f",*non_const_f_ptr);
  %".29" = fpext float %"deref_load.3" to double
  %".30" = call i32 (i8*, ...) @"printf"(i8* %".25", double %".29")
  %".31" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: f
  %"f.2" = load float, float* %"f"
  ;  Source: printf("%f",f);
  %".34" = fpext float %"f.2" to double
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".31", double %".34")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%f\00"
@"str.1" = internal constant [3 x i8] c"%f\00"
@"str.2" = internal constant [3 x i8] c"%f\00"
@"str.3" = internal constant [3 x i8] c"%f\00"
@"str.4" = internal constant [3 x i8] c"%f\00"