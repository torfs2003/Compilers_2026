; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define void @"printPositive"(float %".1")
{
entry:
  %"a" = alloca float
  store float %".1", float* %"a"
  ;  Source: if(a>0.0){printf("%d",(int)a);}
  %"a.1" = load float, float* %"a"
  %".5" = fcmp ogt float %"a.1",              0x0
  %".6" = zext i1 %".5" to i32
  %"ifcond" = icmp ne i32 %".6", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
if.then:
  %".8" = bitcast [3 x i8]* @"str" to i8*
  %"a.2" = load float, float* %"a"
  %".9" = fptosi float %"a.2" to i32
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %".9")
  br label %"if.end"
if.end:
  ret void
}

@"str" = internal constant [3 x i8] c"%d\00"
define i32 @"main"()
{
entry:
  %"arr" = alloca [5 x float]
  ;  Source: floatarr[5]={-10.20,-20.125,31.26,0.00,15.2};
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
  ;  Source: inti=0;
  store i32 0, i32* %"i"
  ;  Source: while(i<5){printPositive(arr[i]);i++;}
  br label %"while.cond"
while.cond:
  %"i.1" = load i32, i32* %"i"
  %".17" = icmp slt i32 %"i.1", 5
  %".18" = zext i1 %".17" to i32
  %"whilecond" = icmp ne i32 %".18", 0
  br i1 %"whilecond", label %"while.body", label %"while.end"
while.body:
  %"i.2" = load i32, i32* %"i"
  %"decay_left" = getelementptr [5 x float], [5 x float]* %"arr", i32 0, i32 0
  %"gep_ptr" = getelementptr float, float* %"decay_left", i32 %"i.2"
  %"array_element" = load float, float* %"gep_ptr"
  call void @"printPositive"(float %"array_element")
  %"i.3" = load i32, i32* %"i"
  %".21" = load i32, i32* %"i"
  %".22" = add i32 %".21", 1
  store i32 %".22", i32* %"i"
  br label %"while.cond"
while.end:
  ;  Source: return0;
  ret i32 0
}
