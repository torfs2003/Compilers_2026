; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.kaas" = type {i32}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"gouda" = alloca %"struct.kaas"
  ;  Source: gouda.melk
  %"gep_melk" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 0
  %"union_cast_melk" = bitcast i32* %"gep_melk" to float*
  %"load_melk" = load float, float* %"union_cast_melk"
  ;  Source: gouda.melk=3.14;
  store float 0x40091eb860000000, float* %"union_cast_melk"
  %".5" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: gouda.melk
  %"gep_melk.1" = getelementptr inbounds %"struct.kaas", %"struct.kaas"* %"gouda", i32 0, i32 0
  %"union_cast_melk.1" = bitcast i32* %"gep_melk.1" to float*
  %"load_melk.1" = load float, float* %"union_cast_melk.1"
  ;  Source: (gouda.melk*1000)
  %".8" = sitofp i32 1000 to float
  %".9" = fmul float %"load_melk.1", %".8"
  ;  Source: (int)(gouda.melk*1000)
  %".11" = fptosi float %".9" to i32
  ;  Source: printf("%d",(int)(gouda.melk*1000));
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %".11")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"