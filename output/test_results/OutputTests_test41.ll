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
  %"kptr" = alloca i32*
  store i32* %"k", i32** %"kptr"
  %"sptr" = alloca i8*
  store i8* %"s", i8** %"sptr"
  ;  Source: kptr
  %"kptr.1" = load i32*, i32** %"kptr"
  ;  Source: sptr
  %"sptr.1" = load i8*, i8** %"sptr"
  ;  Source: kptr=sptr;
  %".34" = bitcast i8* %"sptr.1" to i32*
  store i32* %".34", i32** %"kptr"
  ;  Source: kptr
  %"kptr.2" = load i32*, i32** %"kptr"
  ;  Source: sptr
  %"sptr.2" = load i8*, i8** %"sptr"
  ;  Source: (int*)sptr
  %".39" = bitcast i8* %"sptr.2" to i32*
  ;  Source: kptr=(int*)sptr;
  store i32* %".39", i32** %"kptr"
  %"kptrptr" = alloca i32**
  %"kptr.3" = load i32*, i32** %"kptr"
  %".42" = bitcast i32* %"kptr.3" to i32**
  store i32** %".42", i32*** %"kptrptr"
  %"sptrptrptr" = alloca i8***
  %"kptr.4" = load i32*, i32** %"kptr"
  %".44" = bitcast i32* %"kptr.4" to i8***
  store i8*** %".44", i8**** %"sptrptrptr"
  %"p" = alloca float
  store float 0x40091eb860000000, float* %"p"
  %"pptr" = alloca float*
  store float* %"p", float** %"pptr"
  %"ptrptr" = alloca float**
  %"pptr.1" = load float*, float** %"pptr"
  %".48" = bitcast float* %"pptr.1" to float**
  store float** %".48", float*** %"ptrptr"
  %"pieter" = alloca float**
  store float** %"pptr", float*** %"pieter"
  %".51" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: pieter
  %"pieter.1" = load float**, float*** %"pieter"
  %"deref_load" = load float*, float** %"pieter.1"
  ;  Source: **pieter
  %"deref_load.1" = load float, float* %"deref_load"
  ;  Source: printf("%f",**pieter);
  %".55" = fpext float %"deref_load.1" to double
  %".56" = call i32 (i8*, ...) @"printf"(i8* %".51", double %".55")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%f\00"