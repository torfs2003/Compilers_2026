; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.kaas" = type {i32}
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
  ;  Source: inta[4]={1,2,3,4};
  %".16" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 0
  store i32 1, i32* %".16"
  %".18" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 1
  store i32 2, i32* %".18"
  %".20" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 2
  store i32 3, i32* %".20"
  %".22" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 3
  store i32 4, i32* %".22"
  %"k" = alloca i32*
  ;  Source: a
  ;  Source: int*k=a;
  %".26" = bitcast [4 x i32]* %"a" to i32*
  store i32* %".26", i32** %"k"
  ;  Source: k
  %"k.1" = load i32*, i32** %"k"
  ;  Source: k
  %"k.2" = load i32*, i32** %"k"
  ;  Source: k+2
  %".31" = getelementptr i32, i32* %"k.2", i32 2
  ;  Source: k=k+2;
  store i32* %".31", i32** %"k"
  %".34" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: k
  %"k.3" = load i32*, i32** %"k"
  ;  Source: *k
  %"deref_load" = load i32, i32* %"k.3"
  ;  Source: printf("%d",*k);
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".34", i32 %"deref_load")
  %".39" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: printf("%d",0>1);
  %".41" = call i32 (i8*, ...) @"printf"(i8* %".39", i32 0)
  %"wegdes" = alloca [3 x %"struct.kaas"]
  ;  Source: beemster
  ;  Source: ementaler
  ;  Source: gouda
  ;  Source: structkaaswegdes[3]={beemster,ementaler,gouda};
  %".46" = getelementptr [3 x %"struct.kaas"], [3 x %"struct.kaas"]* %"wegdes", i32 0, i32 0
  %".47" = load %"struct.kaas", %"struct.kaas"* %"beemster"
  store %"struct.kaas" %".47", %"struct.kaas"* %".46"
  %".49" = getelementptr [3 x %"struct.kaas"], [3 x %"struct.kaas"]* %"wegdes", i32 0, i32 1
  %".50" = load %"struct.kaas", %"struct.kaas"* %"ementaler"
  store %"struct.kaas" %".50", %"struct.kaas"* %".49"
  %".52" = getelementptr [3 x %"struct.kaas"], [3 x %"struct.kaas"]* %"wegdes", i32 0, i32 2
  %".53" = load %"struct.kaas", %"struct.kaas"* %"gouda"
  store %"struct.kaas" %".53", %"struct.kaas"* %".52"
  %"ptr" = alloca %"struct.kaas"*
  ;  Source: wegdes
  ;  Source: structkaas*ptr=wegdes;
  %".57" = bitcast [3 x %"struct.kaas"]* %"wegdes" to %"struct.kaas"*
  store %"struct.kaas"* %".57", %"struct.kaas"** %"ptr"
  ;  Source: ptr
  %"ptr.1" = load %"struct.kaas"*, %"struct.kaas"** %"ptr"
  ;  Source: ptr
  %"ptr.2" = load %"struct.kaas"*, %"struct.kaas"** %"ptr"
  ;  Source: ptr+2
  %".62" = getelementptr %"struct.kaas", %"struct.kaas"* %"ptr.2", i32 2
  ;  Source: ptr=ptr+2;
  store %"struct.kaas"* %".62", %"struct.kaas"** %"ptr"
  %".65" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: (*ptr).a
  %"ptr.3" = load %"struct.kaas"*, %"struct.kaas"** %"ptr"
  %"gep_a.3" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ptr.3", i32 0, i32 0
  %"load_a.3" = load i32, i32* %"gep_a.3"
  ;  Source: printf("%d",(*ptr).a);
  %".68" = call i32 (i8*, ...) @"printf"(i8* %".65", i32 %"load_a.3")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"