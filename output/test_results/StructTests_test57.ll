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
  %".11" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 0
  store i32 1, i32* %".11"
  %".13" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 1
  store i32 2, i32* %".13"
  %".15" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 2
  store i32 3, i32* %".15"
  %".17" = getelementptr [4 x i32], [4 x i32]* %"a", i32 0, i32 3
  store i32 4, i32* %".17"
  %"k" = alloca i32*
  %".19" = bitcast [4 x i32]* %"a" to i32*
  store i32* %".19", i32** %"k"
  ;  Source: k
  %"k.1" = load i32*, i32** %"k"
  ;  Source: k
  %"k.2" = load i32*, i32** %"k"
  ;  Source: k+2
  %".24" = getelementptr i32, i32* %"k.2", i32 2
  ;  Source: k=k+2;
  store i32* %".24", i32** %"k"
  %".27" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: k
  %"k.3" = load i32*, i32** %"k"
  ;  Source: *k
  %"deref_load" = load i32, i32* %"k.3"
  ;  Source: printf("%d",*k);
  %".31" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 %"deref_load")
  %".32" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: printf("%d",0>1);
  %".34" = call i32 (i8*, ...) @"printf"(i8* %".32", i32 0)
  %"wegdes" = alloca [3 x %"struct.kaas"]
  %".35" = getelementptr [3 x %"struct.kaas"], [3 x %"struct.kaas"]* %"wegdes", i32 0, i32 0
  %".36" = load %"struct.kaas", %"struct.kaas"* %"beemster"
  store %"struct.kaas" %".36", %"struct.kaas"* %".35"
  %".38" = getelementptr [3 x %"struct.kaas"], [3 x %"struct.kaas"]* %"wegdes", i32 0, i32 1
  %".39" = load %"struct.kaas", %"struct.kaas"* %"ementaler"
  store %"struct.kaas" %".39", %"struct.kaas"* %".38"
  %".41" = getelementptr [3 x %"struct.kaas"], [3 x %"struct.kaas"]* %"wegdes", i32 0, i32 2
  %".42" = load %"struct.kaas", %"struct.kaas"* %"gouda"
  store %"struct.kaas" %".42", %"struct.kaas"* %".41"
  %"ptr" = alloca %"struct.kaas"*
  %".44" = bitcast [3 x %"struct.kaas"]* %"wegdes" to %"struct.kaas"*
  store %"struct.kaas"* %".44", %"struct.kaas"** %"ptr"
  ;  Source: ptr
  %"ptr.1" = load %"struct.kaas"*, %"struct.kaas"** %"ptr"
  ;  Source: ptr
  %"ptr.2" = load %"struct.kaas"*, %"struct.kaas"** %"ptr"
  ;  Source: ptr+2
  %".49" = getelementptr %"struct.kaas", %"struct.kaas"* %"ptr.2", i32 2
  ;  Source: ptr=ptr+2;
  store %"struct.kaas"* %".49", %"struct.kaas"** %"ptr"
  %".52" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: (*ptr).a
  %"ptr.3" = load %"struct.kaas"*, %"struct.kaas"** %"ptr"
  %"gep_a.3" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"ptr.3", i32 0, i32 0
  %"load_a.3" = load i32, i32* %"gep_a.3"
  ;  Source: printf("%d",(*ptr).a);
  %".55" = call i32 (i8*, ...) @"printf"(i8* %".52", i32 %"load_a.3")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"