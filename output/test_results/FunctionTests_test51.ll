; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.kaas" = type {i32, float}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define %"struct.kaas"* @"structCreator"(i32 %".1", float %".2")
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
  ret %"struct.kaas"* %"ptr.1"
}

define i32 @"main"()
{
entry:
  %"ptr" = alloca %"struct.kaas"*
  ;  Source: structkaas*ptr;
  ;  Source: ptr
  %"ptr.1" = load %"struct.kaas"*, %"struct.kaas"** %"ptr"
  ;  Source: structCreator(10,20.0)
  %".5" = call %"struct.kaas"* @"structCreator"(i32 10, float 0x4034000000000000)
  ;  Source: ptr=structCreator(10,20.0);
  store %"struct.kaas"* %".5", %"struct.kaas"** %"ptr"
  %".8" = bitcast [7 x i8]* @"str" to i8*
  ;  Source: ptr->melk
  %".10" = load %"struct.kaas"*, %"struct.kaas"** %"ptr"
  %"gep_melk" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %".10", i32 0, i32 0
  %"load_melk" = load i32, i32* %"gep_melk"
  ;  Source: ptr->yoghurt
  %".12" = load %"struct.kaas"*, %"struct.kaas"** %"ptr"
  %"gep_yoghurt" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %".12", i32 0, i32 1
  %"load_yoghurt" = load float, float* %"gep_yoghurt"
  ;  Source: printf("%d %f ",ptr->melk,ptr->yoghurt);
  %".14" = fpext float %"load_yoghurt" to double
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"load_melk", double %".14")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [7 x i8] c"%d %f \00"