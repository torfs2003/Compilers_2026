; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
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
  %"deref_load" = load float, float* %"f_ptr.1"
  ;  Source: (int)*f_ptr
  %".11" = fptosi float %"deref_load" to i32
  ;  Source: printf("%d",(int)*f_ptr);
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %".11")
  %".14" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: f
  %"f.2" = load float, float* %"f"
  ;  Source: (int)f
  %".17" = fptosi float %"f.2" to i32
  ;  Source: printf("%d",(int)f);
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %".17")
  %"non_const_f_ptr" = alloca float*
  ;  Source: f_ptr
  %"f_ptr.2" = load float*, float** %"f_ptr"
  ;  Source: float*non_const_f_ptr=f_ptr;
  store float* %"f_ptr.2", float** %"non_const_f_ptr"
  %".23" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: non_const_f_ptr
  %"non_const_f_ptr.1" = load float*, float** %"non_const_f_ptr"
  %"deref_load.1" = load float, float* %"non_const_f_ptr.1"
  ;  Source: (int)*non_const_f_ptr
  %".26" = fptosi float %"deref_load.1" to i32
  ;  Source: printf("%d",(int)*non_const_f_ptr);
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 %".26")
  ;  Source: non_const_f_ptr
  %"non_const_f_ptr.2" = load float*, float** %"non_const_f_ptr"
  %"deref_load.2" = load float, float* %"non_const_f_ptr.2"
  ;  Source: *non_const_f_ptr=3.1492;
  store float 0x4009318fc0000000, float* %"non_const_f_ptr.2"
  %".32" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: non_const_f_ptr
  %"non_const_f_ptr.3" = load float*, float** %"non_const_f_ptr"
  %"deref_load.3" = load float, float* %"non_const_f_ptr.3"
  ;  Source: (int)*non_const_f_ptr
  %".35" = fptosi float %"deref_load.3" to i32
  ;  Source: printf("%d",(int)*non_const_f_ptr);
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 %".35")
  %".38" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: f
  %"f.3" = load float, float* %"f"
  ;  Source: (int)f
  %".41" = fptosi float %"f.3" to i32
  ;  Source: printf("%d",(int)f);
  %".43" = call i32 (i8*, ...) @"printf"(i8* %".38", i32 %".41")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"