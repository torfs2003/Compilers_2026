; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.kaas" = type {i32, float}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"mul"(%"struct.kaas"* %".1")
{
entry:
  %"a" = alloca %"struct.kaas"*
  store %"struct.kaas"* %".1", %"struct.kaas"** %"a"
  ;  Source: returna->melk*a->yoghurt;
  %".5" = load %"struct.kaas"*, %"struct.kaas"** %"a"
  %"gep_melk" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %".5", i32 0, i32 0
  %"load_melk" = load i32, i32* %"gep_melk"
  %".6" = load %"struct.kaas"*, %"struct.kaas"** %"a"
  %"gep_yoghurt" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %".6", i32 0, i32 1
  %"load_yoghurt" = load float, float* %"gep_yoghurt"
  %".7" = sitofp i32 %"load_melk" to float
  %".8" = fmul float %".7", %"load_yoghurt"
  %".9" = fptosi float %".8" to i32
  ret i32 %".9"
}

define i32 @"main"()
{
entry:
  %"gouda" = alloca %"struct.kaas"
  ;  Source: gouda.melk
  %"gep_melk" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 0
  %"load_melk" = load i32, i32* %"gep_melk"
  ;  Source: gouda.melk=5;
  store i32 5, i32* %"gep_melk"
  ;  Source: gouda.yoghurt
  %"gep_yoghurt" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 1
  %"load_yoghurt" = load float, float* %"gep_yoghurt"
  ;  Source: gouda.yoghurt=3.14;
  store float 0x40091eb860000000, float* %"gep_yoghurt"
  %".8" = bitcast [16 x i8]* @"str" to i8*
  ;  Source: gouda.melk
  %"gep_melk.1" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 0
  %"load_melk.1" = load i32, i32* %"gep_melk.1"
  ;  Source: gouda.yoghurt
  %"gep_yoghurt.1" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 1
  %"load_yoghurt.1" = load float, float* %"gep_yoghurt.1"
  ;  Source: (gouda.yoghurt*1000)
  %".12" = sitofp i32 1000 to float
  %".13" = fmul float %"load_yoghurt.1", %".12"
  ;  Source: (int)(gouda.yoghurt*1000)
  %".15" = fptosi float %".13" to i32
  ;  Source: printf("%d %d       lol",gouda.melk,(int)(gouda.yoghurt*1000));
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"load_melk.1", i32 %".15")
  %"ptr" = alloca %"struct.kaas"*
  store %"struct.kaas"* %"gouda", %"struct.kaas"** %"ptr"
  %".19" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: ptr
  %"ptr.1" = load %"struct.kaas"*, %"struct.kaas"** %"ptr"
  ;  Source: mul(ptr)
  %".22" = call i32 @"mul"(%"struct.kaas"* %"ptr.1")
  ;  Source: printf("%d",mul(ptr));
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 %".22")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [16 x i8] c"%d %d       lol\00"
@"str.1" = internal constant [3 x i8] c"%d\00"