; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"k" = alloca i8
  store i8 97, i8* %"k"
  %"s" = alloca i32
  store i32 1, i32* %"s"
  %"l" = alloca float
  %".4" = sitofp i32 2 to float
  store float %".4", float* %"l"
  %".6" = bitcast [13 x i8]* @"str" to i8*
  ;  Source: k
  %"k.1" = load i8, i8* %"k"
  ;  Source: s
  %"s.1" = load i32, i32* %"s"
  ;  Source: s
  %"s.2" = load i32, i32* %"s"
  ;  Source: l
  %"l.1" = load float, float* %"l"
  ;  Source: (int)l
  %".12" = fptosi float %"l.1" to i32
  ;  Source: printf("%c %d %x %d ",k,s,s,(int)l);
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".6", i8 %"k.1", i32 %"s.1", i32 %"s.2", i32 %".12")
  %".15" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: l
  %"l.2" = load float, float* %"l"
  ;  Source: &l
  ;  Source: scanf("%f",&l);
  %".19" = call i32 (i8*, ...) @"scanf"(i8* %".15", float* %"l")
  %".20" = bitcast [13 x i8]* @"str.2" to i8*
  ;  Source: k
  %"k.2" = load i8, i8* %"k"
  ;  Source: s
  %"s.3" = load i32, i32* %"s"
  ;  Source: s
  %"s.4" = load i32, i32* %"s"
  ;  Source: l
  %"l.3" = load float, float* %"l"
  ;  Source: (int)l
  %".26" = fptosi float %"l.3" to i32
  ;  Source: printf("%c %d %x %d ",k,s,s,(int)l);
  %".28" = call i32 (i8*, ...) @"printf"(i8* %".20", i8 %"k.2", i32 %"s.3", i32 %"s.4", i32 %".26")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [13 x i8] c"%c %d %x %d \00"
@"str.1" = internal constant [3 x i8] c"%f\00"
@"str.2" = internal constant [13 x i8] c"%c %d %x %d \00"