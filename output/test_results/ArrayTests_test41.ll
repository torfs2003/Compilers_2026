; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.kaas" = type {float}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"main"()
{
entry:
  %"b" = alloca [2 x i32]
  %"gouda" = alloca %"struct.kaas"
  %"ementaler" = alloca %"struct.kaas"
  %"beemster" = alloca %"struct.kaas"
  ;  Source: beemster.a
  %"gep_a" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"beemster", i32 0, i32 0
  %"load_a" = load float, float* %"gep_a"
  ;  Source: beemster.a=0;
  %".4" = sitofp i32 0 to float
  store float %".4", float* %"gep_a"
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
  store [4 x i32] zeroinitializer, [4 x i32]* %"a"
  %".13" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 0
  store i32 1, i32* %".13"
  %".15" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 1
  store i32 2, i32* %".15"
  %".17" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 2
  store i32 3, i32* %".17"
  %".19" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 3
  store i32 4, i32* %".19"
  %"k" = alloca i32*
  %".21" = bitcast [4 x i32]* %"a" to i32*
  store i32* %".21", i32** %"k"
  ;  Source: k
  %"k_load" = load i32*, i32** %"k"
  ;  Source: k
  %"k_load.1" = load i32*, i32** %"k"
  ;  Source: k+2
  %".26" = getelementptr i32, i32* %"k_load.1", i32 2
  ;  Source: k=k+2;
  store i32* %".26", i32** %"k"
  %".29" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: k
  %"k_load.2" = load i32*, i32** %"k"
  ;  Source: *k
  %"deref_load" = load i32, i32* %"k_load.2"
  ;  Source: printf("%d",*k);
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".29", i32 %"deref_load")
  %".34" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: printf("%d",0>1);
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".34", i32 0)
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"