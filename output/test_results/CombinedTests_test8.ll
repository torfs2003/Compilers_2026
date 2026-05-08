; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define float @"whatIsBigger"(float %".1", float %".2")
{
entry:
  %"a" = alloca float
  store float %".1", float* %"a"
  %"b" = alloca float
  store float %".2", float* %"b"
  ;  Source: if(a>b){returna;}else{returnb;}
  %"a_load" = load float, float* %"a"
  %"b_load" = load float, float* %"b"
  %".7" = fcmp ogt float %"a_load", %"b_load"
  %".8" = zext i1 %".7" to i32
  %"ifcond" = icmp ne i32 %".8", 0
  br i1 %"ifcond", label %"if.then", label %"if.else"
if.then:
  %"a_load.1" = load float, float* %"a"
  ret float %"a_load.1"
if.end:
  ret float              0x0
if.else:
  %"b_load.1" = load float, float* %"b"
  ret float %"b_load.1"
}

define i32 @"main"()
{
entry:
  %"biggest" = alloca float
  %".2" = call float @"whatIsBigger"(float 0x40635199a0000000, float 0x408ab13b60000000)
  store float %".2", float* %"biggest"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: biggest
  %"biggest_load" = load float, float* %"biggest"
  ;  Source: printf("%f",biggest);
  %".7" = fpext float %"biggest_load" to double
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".4", double %".7")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%f\00"