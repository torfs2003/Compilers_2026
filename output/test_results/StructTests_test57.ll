; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.kaas" = type {i32}
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
  %"load_a" = load i32, i32* %"gep_a"
  ;  Source: beemster.a=28;
  store i32 28, i32* %"gep_a"
  ;  Source: ementaler.a
  %"gep_a.1" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ementaler", i32 0, i32 0
  %"load_a.1" = load i32, i32* %"gep_a.1"
  ;  Source: ementaler.a=3;
  store i32 3, i32* %"gep_a.1"
  ;  Source: gouda.a
  %"gep_a.2" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 0
  %"load_a.2" = load i32, i32* %"gep_a.2"
  ;  Source: gouda.a=6;
  store i32 6, i32* %"gep_a.2"
  %"a" = alloca [4 x i32]
  store [4 x i32] zeroinitializer, [4 x i32]* %"a"
  %".12" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 0
  store i32 1, i32* %".12"
  %".14" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 1
  store i32 2, i32* %".14"
  %".16" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 2
  store i32 3, i32* %".16"
  %".18" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 3
  store i32 4, i32* %".18"
  %"k" = alloca i32*
  %".20" = bitcast [4 x i32]* %"a" to i32*
  store i32* %".20", i32** %"k"
  ;  Source: k
  %"k_load" = load i32*, i32** %"k"
  ;  Source: k
  %"k_load.1" = load i32*, i32** %"k"
  ;  Source: k+2
  %".25" = getelementptr i32, i32* %"k_load.1", i32 2
  ;  Source: k=k+2;
  store i32* %".25", i32** %"k"
  %".28" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: k
  %"k_load.2" = load i32*, i32** %"k"
  ;  Source: *k
  %"deref_load" = load i32, i32* %"k_load.2"
  ;  Source: printf("%d",*k);
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".28", i32 %"deref_load")
  %".33" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: printf("%d",0>1);
  %".35" = call i32 (i8*, ...) @"printf"(i8* %".33", i32 0)
  %"wegdes" = alloca [3 x %"struct.kaas"]
  store [3 x %"struct.kaas"] zeroinitializer, [3 x %"struct.kaas"]* %"wegdes"
  %".37" = getelementptr [3 x %"struct.kaas"], [3 x %"struct.kaas"]* %"wegdes", i32 0, i32 0
  %".38" = load %"struct.kaas", %"struct.kaas"* %"beemster"
  store %"struct.kaas" %".38", %"struct.kaas"* %".37"
  %".40" = getelementptr [3 x %"struct.kaas"], [3 x %"struct.kaas"]* %"wegdes", i32 0, i32 1
  %".41" = load %"struct.kaas", %"struct.kaas"* %"ementaler"
  store %"struct.kaas" %".41", %"struct.kaas"* %".40"
  %".43" = getelementptr [3 x %"struct.kaas"], [3 x %"struct.kaas"]* %"wegdes", i32 0, i32 2
  %".44" = load %"struct.kaas", %"struct.kaas"* %"gouda"
  store %"struct.kaas" %".44", %"struct.kaas"* %".43"
  %"ptr" = alloca %"struct.kaas"*
  %".46" = bitcast [3 x %"struct.kaas"]* %"wegdes" to %"struct.kaas"*
  store %"struct.kaas"* %".46", %"struct.kaas"** %"ptr"
  ;  Source: ptr
  %"ptr_load" = load %"struct.kaas"*, %"struct.kaas"** %"ptr"
  ;  Source: ptr
  %"ptr_load.1" = load %"struct.kaas"*, %"struct.kaas"** %"ptr"
  ;  Source: ptr+2
  %".51" = getelementptr %"struct.kaas", %"struct.kaas"* %"ptr_load.1", i32 2
  ;  Source: ptr=ptr+2;
  store %"struct.kaas"* %".51", %"struct.kaas"** %"ptr"
  %".54" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: (*ptr).a
  %"ptr_load.2" = load %"struct.kaas"*, %"struct.kaas"** %"ptr"
  %"gep_a.3" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ptr_load.2", i32 0, i32 0
  %"load_a.3" = load i32, i32* %"gep_a.3"
  ;  Source: printf("%d",(*ptr).a);
  %".57" = call i32 (i8*, ...) @"printf"(i8* %".54", i32 %"load_a.3")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"