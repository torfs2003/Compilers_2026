; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.kaas" = type {i32, float}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define %"struct.kaas"* @"structCreator"(i32 %".1", float %".2")
{
entry:
  %"melk" = alloca i32
  store i32 %".1", i32* %"melk"
  %"yoghurt" = alloca float
  store float %".2", float* %"yoghurt"
  %"gouda" = alloca %"struct.kaas"
  ;  Source: gouda.melk
  %"gep_melk" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 0
  %"load_melk" = load i32, i32* %"gep_melk"
  ;  Source: melk
  %"melk_load" = load i32, i32* %"melk"
  ;  Source: gouda.melk=melk;
  store i32 %"melk_load", i32* %"gep_melk"
  ;  Source: gouda.yoghurt
  %"gep_yoghurt" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 1
  %"load_yoghurt" = load float, float* %"gep_yoghurt"
  ;  Source: yoghurt
  %"yoghurt_load" = load float, float* %"yoghurt"
  ;  Source: gouda.yoghurt=yoghurt;
  store float %"yoghurt_load", float* %"gep_yoghurt"
  %"ptr" = alloca %"struct.kaas"*
  store %"struct.kaas"* %"gouda", %"struct.kaas"** %"ptr"
  ;  Source: returnptr;
  %"ptr_load" = load %"struct.kaas"*, %"struct.kaas"** %"ptr"
  ret %"struct.kaas"* %"ptr_load"
}

define i32 @"main"()
{
entry:
  %"ptr" = alloca %"struct.kaas"*
  ;  Source: ptr
  %"ptr_load" = load %"struct.kaas"*, %"struct.kaas"** %"ptr"
  ;  Source: structCreator(10,20.0)
  %".4" = call %"struct.kaas"* @"structCreator"(i32 10, float 0x4034000000000000)
  ;  Source: ptr=structCreator(10,20.0);
  store %"struct.kaas"* %".4", %"struct.kaas"** %"ptr"
  %".7" = bitcast [7 x i8]* @"str" to i8*
  ;  Source: ptr->melk
  %".9" = load %"struct.kaas"*, %"struct.kaas"** %"ptr"
  %"gep_melk" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %".9", i32 0, i32 0
  %"load_melk" = load i32, i32* %"gep_melk"
  ;  Source: ptr->yoghurt
  %".11" = load %"struct.kaas"*, %"struct.kaas"** %"ptr"
  %"gep_yoghurt" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %".11", i32 0, i32 1
  %"load_yoghurt" = load float, float* %"gep_yoghurt"
  ;  Source: printf("%d %f ",ptr->melk,ptr->yoghurt);
  %".13" = fpext float %"load_yoghurt" to double
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %"load_melk", double %".13")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [7 x i8] c"%d %f \00"