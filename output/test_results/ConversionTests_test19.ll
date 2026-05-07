; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"s" = alloca i8
  store i8 115, i8* %"s"
  %"k" = alloca i32
  %"s.1" = load i8, i8* %"s"
  %".3" = sext i8 %"s.1" to i32
  store i32 %".3", i32* %"k"
  %"l" = alloca float
  %"k.1" = load i32, i32* %"k"
  %".5" = sitofp i32 %"k.1" to float
  store float %".5", float* %"l"
  ;  Source: k
  %"k.2" = load i32, i32* %"k"
  ;  Source: l
  %"l.1" = load float, float* %"l"
  ;  Source: k=l;
  %".10" = fptosi float %"l.1" to i32
  store i32 %".10", i32* %"k"
  ;  Source: s
  %"s.2" = load i8, i8* %"s"
  ;  Source: k
  %"k.3" = load i32, i32* %"k"
  ;  Source: s=k;
  %".15" = trunc i32 %"k.3" to i8
  store i8 %".15", i8* %"s"
  ;  Source: k
  %"k.4" = load i32, i32* %"k"
  ;  Source: l
  %"l.2" = load float, float* %"l"
  ;  Source: (int)l
  %".20" = fptosi float %"l.2" to i32
  ;  Source: k=(int)l;
  store i32 %".20", i32* %"k"
  ;  Source: s
  %"s.3" = load i8, i8* %"s"
  ;  Source: k
  %"k.5" = load i32, i32* %"k"
  ;  Source: (char)k
  %".26" = trunc i32 %"k.5" to i8
  ;  Source: s=(char)k;
  store i8 %".26", i8* %"s"
  ;  Source: return0;
  ret i32 0
}
