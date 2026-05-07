; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define float @"smallest"(float %".1", float %".2")
{
entry:
  %"a" = alloca float
  store float %".1", float* %"a"
  %"b" = alloca float
  store float %".2", float* %"b"
  ;  Source: if(a<b){returna;}else{returnb;}
  %"a.1" = load float, float* %"a"
  %"b.1" = load float, float* %"b"
  %".7" = fcmp olt float %"a.1", %"b.1"
  %".8" = zext i1 %".7" to i32
  %"ifcond" = icmp ne i32 %".8", 0
  br i1 %"ifcond", label %"if.then", label %"if.else"
if.then:
  %"a.2" = load float, float* %"a"
  ret float %"a.2"
if.end:
  ret float              0x0
if.else:
  %"b.2" = load float, float* %"b"
  ret float %"b.2"
}

define i32 @"main"()
{
entry:
  %"biggest" = alloca float
  ;  Source: smallest(180.1,180.01)
  %".3" = call float @"smallest"(float 0x4066833340000000, float 0x40668051e0000000)
  ;  Source: floatbiggest=smallest(180.1,180.01);
  store float %".3", float* %"biggest"
  %".6" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: biggest
  %"biggest.1" = load float, float* %"biggest"
  ;  Source: printf("%f",biggest);
  %".9" = fpext float %"biggest.1" to double
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".6", double %".9")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%f\00"