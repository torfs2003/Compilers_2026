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
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f_ptr
  %"f_ptr.1" = load float*, float** %"f_ptr"
  %"deref_load" = load float, float* %"f_ptr.1"
  ;  Source: (int)*f_ptr
  %".7" = fptosi float %"deref_load" to i32
  ;  Source: printf("%d",(int)*f_ptr);
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %".7")
  %".10" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: f
  %"f.1" = load float, float* %"f"
  ;  Source: (int)f
  %".13" = fptosi float %"f.1" to i32
  ;  Source: printf("%d",(int)f);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %".13")
  %"non_const_f_ptr" = alloca float*
  %"f_ptr.2" = load float*, float** %"f_ptr"
  store float* %"f_ptr.2", float** %"non_const_f_ptr"
  %".17" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: non_const_f_ptr
  %"non_const_f_ptr.1" = load float*, float** %"non_const_f_ptr"
  %"deref_load.1" = load float, float* %"non_const_f_ptr.1"
  ;  Source: (int)*non_const_f_ptr
  %".20" = fptosi float %"deref_load.1" to i32
  ;  Source: printf("%d",(int)*non_const_f_ptr);
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".17", i32 %".20")
  ;  Source: non_const_f_ptr
  %"non_const_f_ptr.2" = load float*, float** %"non_const_f_ptr"
  %"deref_load.2" = load float, float* %"non_const_f_ptr.2"
  ;  Source: *non_const_f_ptr=3.1492;
  store float 0x4009318fc0000000, float* %"non_const_f_ptr.2"
  %".26" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: non_const_f_ptr
  %"non_const_f_ptr.3" = load float*, float** %"non_const_f_ptr"
  %"deref_load.3" = load float, float* %"non_const_f_ptr.3"
  ;  Source: (int)*non_const_f_ptr
  %".29" = fptosi float %"deref_load.3" to i32
  ;  Source: printf("%d",(int)*non_const_f_ptr);
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 %".29")
  %".32" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: f
  %"f.2" = load float, float* %"f"
  ;  Source: (int)f
  %".35" = fptosi float %"f.2" to i32
  ;  Source: printf("%d",(int)f);
  %".37" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 %".35")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"