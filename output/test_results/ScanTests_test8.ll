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
  %"k" = alloca i8
  %".2" = trunc i32 0 to i8
  store i8 %".2", i8* %"k"
  %"s" = alloca i32
  store i32 1, i32* %"s"
  %"l" = alloca float
  %".5" = sitofp i32 2 to float
  store float %".5", float* %"l"
  %".7" = bitcast [12 x i8]* @"str" to i8*
  ;  Source: k
  %"k_load" = load i8, i8* %"k"
  ;  Source: s
  %"s_load" = load i32, i32* %"s"
  ;  Source: s
  %"s_load.1" = load i32, i32* %"s"
  ;  Source: l
  %"l_load" = load float, float* %"l"
  ;  Source: printf("%c %d %x %f",k,s,s,l);
  %".13" = sext i8 %"k_load" to i32
  %".14" = fpext float %"l_load" to double
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %".13", i32 %"s_load", i32 %"s_load.1", double %".14")
  %".16" = bitcast [12 x i8]* @"str.1" to i8*
  ;  Source: k
  %"k_load.1" = load i8, i8* %"k"
  ;  Source: &k
  ;  Source: s
  %"s_load.2" = load i32, i32* %"s"
  ;  Source: &s
  ;  Source: s
  %"s_load.3" = load i32, i32* %"s"
  ;  Source: &s
  ;  Source: l
  %"l_load.1" = load float, float* %"l"
  ;  Source: &l
  ;  Source: scanf("%c %d %x %f",&k,&s,&s,&l);
  %".26" = call i32 (i8*, ...) @"scanf"(i8* %".16", i8* %"k", i32* %"s", i32* %"s", float* %"l")
  %".27" = bitcast [12 x i8]* @"str.2" to i8*
  ;  Source: k
  %"k_load.2" = load i8, i8* %"k"
  ;  Source: s
  %"s_load.4" = load i32, i32* %"s"
  ;  Source: s
  %"s_load.5" = load i32, i32* %"s"
  ;  Source: l
  %"l_load.2" = load float, float* %"l"
  ;  Source: printf("%c %d %x %f",k,s,s,l);
  %".33" = sext i8 %"k_load.2" to i32
  %".34" = fpext float %"l_load.2" to double
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 %".33", i32 %"s_load.4", i32 %"s_load.5", double %".34")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [12 x i8] c"%c %d %x %f\00"
@"str.1" = internal constant [12 x i8] c"%c %d %x %f\00"
@"str.2" = internal constant [12 x i8] c"%c %d %x %f\00"