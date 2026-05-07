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
  ;  Source: printf("%f",gouda.melk);
  %".8" = fpext float %"load_melk.1" to double
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".5", double %".8")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%f\00"