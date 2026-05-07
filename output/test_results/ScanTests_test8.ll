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
  %"k" = alloca i8
  ;  Source: chark=0;
  %".3" = trunc i32 0 to i8
  store i8 %".3", i8* %"k"
  %"s" = alloca i32
  ;  Source: ints=1;
  store i32 1, i32* %"s"
  %"l" = alloca float
  ;  Source: floatl=2;
  %".8" = sitofp i32 2 to float
  store float %".8", float* %"l"
  %".10" = bitcast [12 x i8]* @"str" to i8*
  ;  Source: k
  %"k.1" = load i8, i8* %"k"
  ;  Source: s
  %"s.1" = load i32, i32* %"s"
  ;  Source: s
  %"s.2" = load i32, i32* %"s"
  ;  Source: l
  %"l.1" = load float, float* %"l"
  ;  Source: printf("%c %d %x %f",k,s,s,l);
  %".16" = zext i8 %"k.1" to i32
  %".17" = fpext float %"l.1" to double
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 %".16", i32 %"s.1", i32 %"s.2", double %".17")
  %".19" = bitcast [12 x i8]* @"str.1" to i8*
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
  %".29" = call i32 (i8*, ...) @"scanf"(i8* %".19", i8* %"k", i32* %"s", i32* %"s", float* %"l")
  %".30" = bitcast [12 x i8]* @"str.2" to i8*
  ;  Source: k
  %"k.3" = load i8, i8* %"k"
  ;  Source: s
  %"s.5" = load i32, i32* %"s"
  ;  Source: s
  %"s.6" = load i32, i32* %"s"
  ;  Source: l
  %"l.3" = load float, float* %"l"
  ;  Source: printf("%c %d %x %f",k,s,s,l);
  %".36" = zext i8 %"k.3" to i32
  %".37" = fpext float %"l.3" to double
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 %".36", i32 %"s.5", i32 %"s.6", double %".37")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [12 x i8] c"%c %d %x %f\00"
@"str.1" = internal constant [12 x i8] c"%c %d %x %f\00"
@"str.2" = internal constant [12 x i8] c"%c %d %x %f\00"