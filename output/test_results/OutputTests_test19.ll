; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

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

define i32 @"main"()
{
entry:
  %"f" = alloca float
  ;  Source: constfloatf=0.789;
  store float 0x3fe93f7ce0000000, float* %"f"
  %"f_ptr" = alloca float*
  ;  Source: f
  %"f.1" = load float, float* %"f"
  ;  Source: &f
  ;  Source: constfloat*f_ptr=&f;
  store float* %"f", float** %"f_ptr"
  %".8" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f_ptr
  %"f_ptr.1" = load float*, float** %"f_ptr"
  ;  Source: *f_ptr
  %"deref_load" = load float, float* %"f_ptr.1"
  ;  Source: printf("%f",*f_ptr);
  %".12" = fpext float %"deref_load" to double
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".8", double %".12")
  %".14" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: f
  %"f.2" = load float, float* %"f"
  ;  Source: printf("%f",f);
  %".17" = fpext float %"f.2" to double
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".14", double %".17")
  %"non_const_f_ptr" = alloca float*
  ;  Source: f_ptr
  %"f_ptr.2" = load float*, float** %"f_ptr"
  ;  Source: float*non_const_f_ptr=f_ptr;
  store float* %"f_ptr.2", float** %"non_const_f_ptr"
  %".22" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: non_const_f_ptr
  %"non_const_f_ptr.1" = load float*, float** %"non_const_f_ptr"
  ;  Source: *non_const_f_ptr
  %"deref_load.1" = load float, float* %"non_const_f_ptr.1"
  ;  Source: printf("%f",*non_const_f_ptr);
  %".26" = fpext float %"deref_load.1" to double
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".22", double %".26")
  ;  Source: non_const_f_ptr
  %"non_const_f_ptr.2" = load float*, float** %"non_const_f_ptr"
  %"deref_load.2" = load float, float* %"non_const_f_ptr.2"
  ;  Source: *non_const_f_ptr=3.1492;
  store float 0x4009318fc0000000, float* %"non_const_f_ptr.2"
  %".31" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: non_const_f_ptr
  %"non_const_f_ptr.3" = load float*, float** %"non_const_f_ptr"
  ;  Source: *non_const_f_ptr
  %"deref_load.3" = load float, float* %"non_const_f_ptr.3"
  ;  Source: printf("%f",*non_const_f_ptr);
  %".35" = fpext float %"deref_load.3" to double
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".31", double %".35")
  %".37" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: f
  %"f.3" = load float, float* %"f"
  ;  Source: printf("%f",f);
  %".40" = fpext float %"f.3" to double
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".37", double %".40")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%f\00"
@"str.1" = internal constant [3 x i8] c"%f\00"
@"str.2" = internal constant [3 x i8] c"%f\00"
@"str.3" = internal constant [3 x i8] c"%f\00"
@"str.4" = internal constant [3 x i8] c"%f\00"