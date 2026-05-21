; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"main"()
{
entry:
  %"arr" = alloca [5 x float]
  %".2" = getelementptr [5 x float], [5 x float]* %"arr", i32 0, i32 0
  store float 0xc024666660000000, float* %".2"
  %".4" = getelementptr [5 x float], [5 x float]* %"arr", i32 0, i32 1
  store float 0xc034200000000000, float* %".4"
  %".6" = getelementptr [5 x float], [5 x float]* %"arr", i32 0, i32 2
  store float 0x403f428f60000000, float* %".6"
  %".8" = getelementptr [5 x float], [5 x float]* %"arr", i32 0, i32 3
  store float              0x0, float* %".8"
  %".10" = getelementptr [5 x float], [5 x float]* %"arr", i32 0, i32 4
  store float 0x402e666660000000, float* %".10"
  ;  Source: arr
  ;  Source: arr[2]
  %"gep_array" = getelementptr [5 x float], [5 x float]* %"arr", i32 0, i32 2
  %"array_element" = load float, float* %"gep_array"
  ;  Source: arr[2]=6;
  %".15" = sitofp i32 6 to float
  store float %".15", float* %"gep_array"
  ;  Source: return0;
  ret i32 0
}
