; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"arr" = alloca [5 x float]
  ;  Source: constfloatarr[5]={-10.20,-20.125,31.26,0.00,15.2};
  %".3" = getelementptr [5 x float], [5 x float]* %"arr", i32 0, i32 0
  store float 0xc024666660000000, float* %".3"
  %".5" = getelementptr [5 x float], [5 x float]* %"arr", i32 0, i32 1
  store float 0xc034200000000000, float* %".5"
  %".7" = getelementptr [5 x float], [5 x float]* %"arr", i32 0, i32 2
  store float 0x403f428f60000000, float* %".7"
  %".9" = getelementptr [5 x float], [5 x float]* %"arr", i32 0, i32 3
  store float              0x0, float* %".9"
  %".11" = getelementptr [5 x float], [5 x float]* %"arr", i32 0, i32 4
  store float 0x402e666660000000, float* %".11"
  ;  Source: arr
  ;  Source: arr[2]
  %"decay_left" = getelementptr [5 x float], [5 x float]* %"arr", i32 0, i32 0
  %"gep_ptr" = getelementptr float, float* %"decay_left", i32 2
  %"array_element" = load float, float* %"gep_ptr"
  ;  Source: arr[2]=6;
  %".16" = sitofp i32 6 to float
  store float %".16", float* %"gep_ptr"
  ;  Source: return0;
  ret i32 0
}
