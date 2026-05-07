; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"union.kaas" = type {i32, i32, i32}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"gouda" = alloca %"union.kaas"
  ;  Source: gouda.melk
  %"gep_melk" = getelementptr inbounds %"union.kaas", %"union.kaas"* %"gouda", i32 0, i32 0
  %"load_melk" = load i32, i32* %"gep_melk"
  ;  Source: gouda.melk=5;
  store i32 5, i32* %"gep_melk"
  ;  Source: gouda.yoghurt
  %"gep_yoghurt" = getelementptr inbounds %"union.kaas", %"union.kaas"* %"gouda", i32 0, i32 0
  %"union_cast_yoghurt" = bitcast i32* %"gep_yoghurt" to float*
  %"load_yoghurt" = load float, float* %"union_cast_yoghurt"
  ;  Source: gouda.yoghurt=3;
  %".7" = sitofp i32 3 to float
  store float %".7", float* %"union_cast_yoghurt"
  %".9" = bitcast [5 x i8]* @"str" to i8*
  ;  Source: gouda.melk
  %"gep_melk.1" = getelementptr inbounds %"union.kaas", %"union.kaas"* %"gouda", i32 0, i32 0
  %"load_melk.1" = load i32, i32* %"gep_melk.1"
  ;  Source: gouda.yoghurt
  %"gep_yoghurt.1" = getelementptr inbounds %"union.kaas", %"union.kaas"* %"gouda", i32 0, i32 0
  %"union_cast_yoghurt.1" = bitcast i32* %"gep_yoghurt.1" to float*
  %"load_yoghurt.1" = load float, float* %"union_cast_yoghurt.1"
  ;  Source: printf("%d%d",gouda.melk,gouda.yoghurt);
  %".13" = fpext float %"load_yoghurt.1" to double
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %"load_melk.1", double %".13")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [5 x i8] c"%d%d\00"