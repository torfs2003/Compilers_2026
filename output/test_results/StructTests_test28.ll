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
  ;  Source: gouda.yoghurt=3.14;
  store float 0x40091eb860000000, float* %"union_cast_yoghurt"
  %".8" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: gouda.yoghurt
  %"gep_yoghurt.1" = getelementptr inbounds %"union.kaas", %"union.kaas"* %"gouda", i32 0, i32 0
  %"union_cast_yoghurt.1" = bitcast i32* %"gep_yoghurt.1" to float*
  %"load_yoghurt.1" = load float, float* %"union_cast_yoghurt.1"
  ;  Source: (gouda.yoghurt*1000)
  %".11" = sitofp i32 1000 to float
  %".12" = fmul float %"load_yoghurt.1", %".11"
  ;  Source: (int)(gouda.yoghurt*1000)
  %".14" = fptosi float %".12" to i32
  ;  Source: printf("%d\n",(int)(gouda.yoghurt*1000));
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %".14")
  ;  Source: gouda.melk
  %"gep_melk.1" = getelementptr inbounds %"union.kaas", %"union.kaas"* %"gouda", i32 0, i32 0
  %"load_melk.1" = load i32, i32* %"gep_melk.1"
  ;  Source: gouda.melk=7;
  store i32 7, i32* %"gep_melk.1"
  %".20" = bitcast [4 x i8]* @"str.1" to i8*
  ;  Source: gouda.melk
  %"gep_melk.2" = getelementptr inbounds %"union.kaas", %"union.kaas"* %"gouda", i32 0, i32 0
  %"load_melk.2" = load i32, i32* %"gep_melk.2"
  ;  Source: printf("%d\n",gouda.melk);
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 %"load_melk.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"
@"str.1" = internal constant [4 x i8] c"%d\0a\00"