; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.kaas" = type {float}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"b" = alloca [2 x i32]
  ;  Source: intb[2];
  %"gouda" = alloca %"struct.kaas"
  ;  Source: structkaasgouda;
  %"ementaler" = alloca %"struct.kaas"
  ;  Source: structkaasementaler;
  %"beemster" = alloca %"struct.kaas"
  ;  Source: structkaasbeemster;
  ;  Source: beemster.a
  %"gep_a" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"beemster", i32 0, i32 0
  %"load_a" = load float, float* %"gep_a"
  ;  Source: beemster.a=28;
  %".8" = sitofp i32 28 to float
  store float %".8", float* %"gep_a"
  ;  Source: ementaler.a
  %"gep_a.1" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ementaler", i32 0, i32 0
  %"load_a.1" = load float, float* %"gep_a.1"
  ;  Source: ementaler.a=3.14;
  store float 0x40091eb860000000, float* %"gep_a.1"
  ;  Source: gouda.a
  %"gep_a.2" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 0
  %"load_a.2" = load float, float* %"gep_a.2"
  ;  Source: gouda.a=6.28;
  store float 0x40191eb860000000, float* %"gep_a.2"
  %"a" = alloca [4 x i32]
  ;  Source: inta[4]={1,2,3,4};
  %".17" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 0
  store i32 1, i32* %".17"
  %".19" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 1
  store i32 2, i32* %".19"
  %".21" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 2
  store i32 3, i32* %".21"
  %".23" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 3
  store i32 4, i32* %".23"
  %"k" = alloca i32*
  ;  Source: a
  ;  Source: int*k=a;
  %".27" = bitcast [4 x i32]* %"a" to i32*
  store i32* %".27", i32** %"k"
  ;  Source: k
  %"k.1" = load i32*, i32** %"k"
  ;  Source: k
  %"k.2" = load i32*, i32** %"k"
  ;  Source: k+2
  %".32" = getelementptr i32, i32* %"k.2", i32 2
  ;  Source: k=k+2;
  store i32* %".32", i32** %"k"
  %".35" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: k
  %"k.3" = load i32*, i32** %"k"
  ;  Source: *k
  %"deref_load" = load i32, i32* %"k.3"
  ;  Source: printf("%d",*k);
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".35", i32 %"deref_load")
  %".40" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: printf("%d",0>1);
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".40", i32 0)
  %"wegdes" = alloca [3 x %"struct.kaas"]
  ;  Source: beemster
  ;  Source: ementaler
  ;  Source: gouda
  ;  Source: structkaaswegdes[3]={beemster,ementaler,gouda};
  %".47" = getelementptr [3 x %"struct.kaas"], [3 x %"struct.kaas"]* %"wegdes", i32 0, i32 0
  %".48" = load %"struct.kaas", %"struct.kaas"* %"beemster"
  store %"struct.kaas" %".48", %"struct.kaas"* %".47"
  %".50" = getelementptr [3 x %"struct.kaas"], [3 x %"struct.kaas"]* %"wegdes", i32 0, i32 1
  %".51" = load %"struct.kaas", %"struct.kaas"* %"ementaler"
  store %"struct.kaas" %".51", %"struct.kaas"* %".50"
  %".53" = getelementptr [3 x %"struct.kaas"], [3 x %"struct.kaas"]* %"wegdes", i32 0, i32 2
  %".54" = load %"struct.kaas", %"struct.kaas"* %"gouda"
  store %"struct.kaas" %".54", %"struct.kaas"* %".53"
  %"ptr" = alloca %"struct.kaas"*
  ;  Source: wegdes
  ;  Source: structkaas*ptr=wegdes;
  %".58" = bitcast [3 x %"struct.kaas"]* %"wegdes" to %"struct.kaas"*
  store %"struct.kaas"* %".58", %"struct.kaas"** %"ptr"
  %".60" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: (*ptr).a
  %"ptr.1" = load %"struct.kaas"*, %"struct.kaas"** %"ptr"
  %"gep_a.3" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ptr.1", i32 0, i32 0
  %"load_a.3" = load float, float* %"gep_a.3"
  ;  Source: printf("%f",(*ptr).a);
  %".63" = fpext float %"load_a.3" to double
  %".64" = call i32 (i8*, ...) @"printf"(i8* %".60", double %".63")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%f\00"