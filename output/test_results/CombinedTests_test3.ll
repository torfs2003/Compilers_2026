; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define void @"printPositive"(float %".1")
{
entry:
  %"a" = alloca float
  store float %".1", float* %"a"
  ;  Source: if(a>0.0){printf("f%",a);}
  %"a_load" = load float, float* %"a"
  %".5" = fcmp ogt float %"a_load",              0x0
  %".6" = zext i1 %".5" to i32
  %"ifcond" = icmp ne i32 %".6", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
if.then:
  %".8" = bitcast [3 x i8]* @"str" to i8*
  %"a_load.1" = load float, float* %"a"
  %".9" = fpext float %"a_load.1" to double
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".8", double %".9")
  br label %"if.end"
if.end:
  ret void
}

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
  %"i" = alloca i32
  store i32 0, i32* %"i"
  ;  Source: while(i<5){printPositive(arr[i]);i++;}
  br label %"while.cond"
while.cond:
  %"i_load" = load i32, i32* %"i"
  %".15" = icmp slt i32 %"i_load", 5
  %".16" = zext i1 %".15" to i32
  %"whilecond" = icmp ne i32 %".16", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"i_load.1" = load i32, i32* %"i"
  %"gep_array" = getelementptr [5 x float], [5 x float]* %"arr", i32 0, i32 %"i_load.1"
  %"array_element" = load float, float* %"gep_array"
  call void @"printPositive"(float %"array_element")
  %"i_load.2" = load i32, i32* %"i"
  %".19" = load i32, i32* %"i"
  %".20" = add i32 %".19", 1
  store i32 %".20", i32* %"i"
  br label %"while.cond"
while.end:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"f%\00"