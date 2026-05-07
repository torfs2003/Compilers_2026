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
  %"k.1" = load i8, i8* %"k"
  ;  Source: s
  %"s.1" = load i32, i32* %"s"
  ;  Source: s
  %"s.2" = load i32, i32* %"s"
  ;  Source: l
  %"l.1" = load float, float* %"l"
  ;  Source: printf("%c %d %x %f",k,s,s,l);
  %".13" = fpext float %"l.1" to double
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".7", i8 %"k.1", i32 %"s.1", i32 %"s.2", double %".13")
  %".15" = bitcast [12 x i8]* @"str.1" to i8*
  ;  Source: k
  %"k.2" = load i8, i8* %"k"
  ;  Source: &k
  ;  Source: s
  %"s.3" = load i32, i32* %"s"
  ;  Source: &s
  ;  Source: s
  %"s.4" = load i32, i32* %"s"
  ;  Source: &s
  ;  Source: l
  %"l.2" = load float, float* %"l"
  ;  Source: &l
  ;  Source: scanf("%c %d %x %f",&k,&s,&s,&l);
  %".25" = call i32 (i8*, ...) @"scanf"(i8* %".15", i8* %"k", i32* %"s", i32* %"s", float* %"l")
  %".26" = bitcast [12 x i8]* @"str.2" to i8*
  ;  Source: k
  %"k.3" = load i8, i8* %"k"
  ;  Source: s
  %"s.5" = load i32, i32* %"s"
  ;  Source: s
  %"s.6" = load i32, i32* %"s"
  ;  Source: l
  %"l.3" = load float, float* %"l"
  ;  Source: printf("%c %d %x %f",k,s,s,l);
  %".32" = fpext float %"l.3" to double
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".26", i8 %"k.3", i32 %"s.5", i32 %"s.6", double %".32")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [12 x i8] c"%c %d %x %f\00"
@"str.1" = internal constant [12 x i8] c"%c %d %x %f\00"
@"str.2" = internal constant [12 x i8] c"%c %d %x %f\00"