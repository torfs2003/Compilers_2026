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
  store [5 x float] zeroinitializer, [5 x float]* %"arr"
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
  %"i" = alloca i32
  store i32 0, i32* %"i"
  ;  Source: while(i<5){printPositive(arr[i]);i++;}
  br label %"while.cond"
while.cond:
  %"i_load" = load i32, i32* %"i"
  %".16" = icmp slt i32 %"i_load", 5
  %".17" = zext i1 %".16" to i32
  %"whilecond" = icmp ne i32 %".17", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"i_load.1" = load i32, i32* %"i"
  %"gep_array" = getelementptr [5 x float], [5 x float]* %"arr", i32 0, i32 %"i_load.1"
  %"array_element" = load float, float* %"gep_array"
  call void @"printPositive"(float %"array_element")
  %"i_load.2" = load i32, i32* %"i"
  %".20" = load i32, i32* %"i"
  %".21" = add i32 %".20", 1
  store i32 %".21", i32* %"i"
  br label %"while.cond"
while.end:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"f%\00"