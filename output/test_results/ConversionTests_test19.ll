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
  %"s" = alloca i8
  ;  Source: chars='s';
  store i8 115, i8* %"s"
  %"k" = alloca i32
  ;  Source: s
  %"s.1" = load i8, i8* %"s"
  ;  Source: intk=s;
  %".6" = sext i8 %"s.1" to i32
  store i32 %".6", i32* %"k"
  %"l" = alloca float
  ;  Source: k
  %"k.1" = load i32, i32* %"k"
  ;  Source: floatl=k;
  %".10" = sitofp i32 %"k.1" to float
  store float %".10", float* %"l"
  ;  Source: k
  %"k.2" = load i32, i32* %"k"
  ;  Source: l
  %"l.1" = load float, float* %"l"
  ;  Source: k=l;
  %".15" = fptosi float %"l.1" to i32
  store i32 %".15", i32* %"k"
  ;  Source: s
  %"s.2" = load i8, i8* %"s"
  ;  Source: k
  %"k.3" = load i32, i32* %"k"
  ;  Source: s=k;
  %".20" = trunc i32 %"k.3" to i8
  store i8 %".20", i8* %"s"
  ;  Source: k
  %"k.4" = load i32, i32* %"k"
  ;  Source: l
  %"l.2" = load float, float* %"l"
  ;  Source: (int)l
  %".25" = fptosi float %"l.2" to i32
  ;  Source: k=(int)l;
  store i32 %".25", i32* %"k"
  ;  Source: s
  %"s.3" = load i8, i8* %"s"
  ;  Source: k
  %"k.5" = load i32, i32* %"k"
  ;  Source: (char)k
  %".31" = trunc i32 %"k.5" to i8
  ;  Source: s=(char)k;
  store i8 %".31", i8* %"s"
  ;  Source: return0;
  ret i32 0
}
