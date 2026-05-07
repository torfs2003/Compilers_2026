; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define float @"vergelijken"(i32 %".1", i32 %".2")
{
entry:
  %"a" = alloca i32
  store i32 %".1", i32* %"a"
  %"b" = alloca i32
  store i32 %".2", i32* %"b"
  ;  Source: if(a==b){return1;}
  %"a.1" = load i32, i32* %"a"
  %"b.1" = load i32, i32* %"b"
  %".7" = icmp eq i32 %"a.1", %"b.1"
  %".8" = zext i1 %".7" to i32
  %"ifcond" = icmp ne i32 %".8", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
if.then:
  %".10" = sitofp i32 1 to float
  ret float %".10"
if.end:
  ;  Source: return0;
  %".13" = sitofp i32 0 to float
  ret float %".13"
}

define i32 @"main"()
{
entry:
  %"boolean" = alloca float
  %".2" = sext i8 97 to i32
  %".3" = call float @"vergelijken"(i32 %".2", i32 20)
  store float %".3", float* %"boolean"
  %".5" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: boolean
  %"boolean.1" = load float, float* %"boolean"
  ;  Source: printf("%f",boolean);
  %".8" = fpext float %"boolean.1" to double
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".5", double %".8")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%f\00"