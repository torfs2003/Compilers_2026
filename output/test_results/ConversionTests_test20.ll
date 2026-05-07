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
  %"kptr" = alloca i32*
  ;  Source: k
  %"k.6" = load i32, i32* %"k"
  ;  Source: &k
  ;  Source: int*kptr=&k;
  store i32* %"k", i32** %"kptr"
  %"sptr" = alloca i8*
  ;  Source: s
  %"s.4" = load i8, i8* %"s"
  ;  Source: &s
  ;  Source: char*sptr=&s;
  store i8* %"s", i8** %"sptr"
  ;  Source: kptr
  %"kptr.1" = load i32*, i32** %"kptr"
  ;  Source: sptr
  %"sptr.1" = load i8*, i8** %"sptr"
  ;  Source: kptr=sptr;
  %".45" = bitcast i8* %"sptr.1" to i32*
  store i32* %".45", i32** %"kptr"
  ;  Source: kptr
  %"kptr.2" = load i32*, i32** %"kptr"
  ;  Source: sptr
  %"sptr.2" = load i8*, i8** %"sptr"
  ;  Source: (int*)sptr
  %".50" = ptrtoint i8* %"sptr.2" to i32
  ;  Source: kptr=(int*)sptr;
  %".52" = inttoptr i32 %".50" to i32*
  store i32* %".52", i32** %"kptr"
  %"kptrptr" = alloca i32**
  ;  Source: kptr
  %"kptr.3" = load i32*, i32** %"kptr"
  ;  Source: int**kptrptr=kptr;
  %".56" = bitcast i32* %"kptr.3" to i32**
  store i32** %".56", i32*** %"kptrptr"
  %"sptrptrptr" = alloca i8***
  ;  Source: kptr
  %"kptr.4" = load i32*, i32** %"kptr"
  ;  Source: char***sptrptrptr=kptr;
  %".60" = bitcast i32* %"kptr.4" to i8***
  store i8*** %".60", i8**** %"sptrptrptr"
  %"p" = alloca float
  ;  Source: floatp=3.14;
  store float 0x40091eb860000000, float* %"p"
  %"pptr" = alloca float*
  ;  Source: p
  %"p.1" = load float, float* %"p"
  ;  Source: &p
  ;  Source: float*pptr=&p;
  store float* %"p", float** %"pptr"
  %"ptrptr" = alloca float**
  ;  Source: pptr
  %"pptr.1" = load float*, float** %"pptr"
  ;  Source: float**ptrptr=pptr;
  %".70" = bitcast float* %"pptr.1" to float**
  store float** %".70", float*** %"ptrptr"
  %"pieter" = alloca float**
  ;  Source: pptr
  %"pptr.2" = load float*, float** %"pptr"
  ;  Source: &pptr
  ;  Source: float**pieter=&pptr;
  store float** %"pptr", float*** %"pieter"
  %".76" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: pieter
  %"pieter.1" = load float**, float*** %"pieter"
  %"deref_load" = load float*, float** %"pieter.1"
  ;  Source: **pieter
  %"deref_load.1" = load float, float* %"deref_load"
  ;  Source: printf("%f",**pieter);
  %".80" = fpext float %"deref_load.1" to double
  %".81" = call i32 (i8*, ...) @"printf"(i8* %".76", double %".80")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%f\00"