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
  %"s_load" = load i8, i8* %"s"
  %".3" = sext i8 %"s_load" to i32
  store i32 %".3", i32* %"k"
  %"l" = alloca float
  %"k_load" = load i32, i32* %"k"
  %".5" = sitofp i32 %"k_load" to float
  store float %".5", float* %"l"
  ;  Source: k
  %"k_load.1" = load i32, i32* %"k"
  ;  Source: l
  %"l_load" = load float, float* %"l"
  ;  Source: k=l;
  %".10" = fptosi float %"l_load" to i32
  store i32 %".10", i32* %"k"
  ;  Source: s
  %"s_load.1" = load i8, i8* %"s"
  ;  Source: k
  %"k_load.2" = load i32, i32* %"k"
  ;  Source: s=k;
  %".15" = trunc i32 %"k_load.2" to i8
  store i8 %".15", i8* %"s"
  ;  Source: k
  %"k_load.3" = load i32, i32* %"k"
  ;  Source: l
  %"l_load.1" = load float, float* %"l"
  ;  Source: (int)l
  %".20" = fptosi float %"l_load.1" to i32
  ;  Source: k=(int)l;
  store i32 %".20", i32* %"k"
  ;  Source: s
  %"s_load.2" = load i8, i8* %"s"
  ;  Source: k
  %"k_load.4" = load i32, i32* %"k"
  ;  Source: (char)k
  %".26" = trunc i32 %"k_load.4" to i8
  ;  Source: s=(char)k;
  store i8 %".26", i8* %"s"
  %"kptr" = alloca i32*
  store i32* %"k", i32** %"kptr"
  %"sptr" = alloca i8*
  store i8* %"s", i8** %"sptr"
  ;  Source: kptr
  %"kptr_load" = load i32*, i32** %"kptr"
  ;  Source: sptr
  %"sptr_load" = load i8*, i8** %"sptr"
  ;  Source: kptr=sptr;
  %".34" = bitcast i8* %"sptr_load" to i32*
  store i32* %".34", i32** %"kptr"
  ;  Source: kptr
  %"kptr_load.1" = load i32*, i32** %"kptr"
  ;  Source: sptr
  %"sptr_load.1" = load i8*, i8** %"sptr"
  ;  Source: (int*)sptr
  %".39" = bitcast i8* %"sptr_load.1" to i32*
  ;  Source: kptr=(int*)sptr;
  store i32* %".39", i32** %"kptr"
  %"kptrptr" = alloca i32**
  %"kptr_load.2" = load i32*, i32** %"kptr"
  %".42" = bitcast i32* %"kptr_load.2" to i32**
  store i32** %".42", i32*** %"kptrptr"
  %"sptrptrptr" = alloca i8***
  %"kptr_load.3" = load i32*, i32** %"kptr"
  %".44" = bitcast i32* %"kptr_load.3" to i8***
  store i8*** %".44", i8**** %"sptrptrptr"
  %"p" = alloca float
  store float 0x40091eb860000000, float* %"p"
  %"pptr" = alloca float*
  store float* %"p", float** %"pptr"
  %"ptrptr" = alloca float**
  %"pptr_load" = load float*, float** %"pptr"
  %".48" = bitcast float* %"pptr_load" to float**
  store float** %".48", float*** %"ptrptr"
  %"pieter" = alloca float**
  store float** %"pptr", float*** %"pieter"
  %"a" = alloca i32
  %"pptr_load.1" = load float*, float** %"pptr"
  %".51" = load float*, float** %"pptr"
  %"ptr_incdec" = getelementptr float, float* %".51", i32 1
  store float* %"ptr_incdec", float** %"pptr"
  %".53" = ptrtoint float* %".51" to i32
  store i32 %".53", i32* %"a"
  ;  Source: return0;
  ret i32 0
}
