; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.kaas" = type {i32, float}
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

define i32* @"structCreator"(i32 %".1", float %".2")
{
entry:
  %"melk" = alloca i32
  store i32 %".1", i32* %"melk"
  %"yoghurt" = alloca float
  store float %".2", float* %"yoghurt"
  %"gouda" = alloca %"struct.kaas"
  ;  Source: structkaasgouda;
  ;  Source: gouda.melk
  %"gep_melk" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 0
  %"load_melk" = load i32, i32* %"gep_melk"
  ;  Source: melk
  %"melk.1" = load i32, i32* %"melk"
  ;  Source: gouda.melk=melk;
  store i32 %"melk.1", i32* %"gep_melk"
  ;  Source: gouda.yoghurt
  %"gep_yoghurt" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 1
  %"load_yoghurt" = load float, float* %"gep_yoghurt"
  ;  Source: yoghurt
  %"yoghurt.1" = load float, float* %"yoghurt"
  ;  Source: gouda.yoghurt=yoghurt;
  store float %"yoghurt.1", float* %"gep_yoghurt"
  %"ptr" = alloca %"struct.kaas"*
  ;  Source: gouda
  ;  Source: &gouda
  ;  Source: structkaas*ptr=&gouda;
  store %"struct.kaas"* %"gouda", %"struct.kaas"** %"ptr"
  ;  Source: returnptr;
  %"ptr.1" = load %"struct.kaas"*, %"struct.kaas"** %"ptr"
  %".20" = bitcast %"struct.kaas"* %"ptr.1" to i32*
  ret i32* %".20"
}

define i32 @"main"()
{
entry:
  %"ptr" = alloca %"struct.kaas"*
  ;  Source: structkaas*ptr;
  ;  Source: ptr
  %"ptr.1" = load %"struct.kaas"*, %"struct.kaas"** %"ptr"
  ;  Source: structCreator(10,20.0)
  %".5" = call i32* @"structCreator"(i32 10, float 0x4034000000000000)
  ;  Source: ptr=structCreator(10,20.0);
  %".7" = bitcast i32* %".5" to %"struct.kaas"*
  store %"struct.kaas"* %".7", %"struct.kaas"** %"ptr"
  %".9" = bitcast [7 x i8]* @"str" to i8*
  ;  Source: ptr->melk
  %".11" = load %"struct.kaas"*, %"struct.kaas"** %"ptr"
  %"gep_melk" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %".11", i32 0, i32 0
  %"load_melk" = load i32, i32* %"gep_melk"
  ;  Source: ptr->yoghurt
  %".13" = load %"struct.kaas"*, %"struct.kaas"** %"ptr"
  %"gep_yoghurt" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %".13", i32 0, i32 1
  %"load_yoghurt" = load float, float* %"gep_yoghurt"
  ;  Source: (int)ptr->yoghurt
  %".15" = fptosi float %"load_yoghurt" to i32
  ;  Source: printf("%d %d ",ptr->melk,(int)ptr->yoghurt);
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %"load_melk", i32 %".15")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [7 x i8] c"%d %d \00"