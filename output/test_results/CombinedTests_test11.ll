; ModuleID = "cmm_module"
<<<<<<< HEAD
target triple = "x86_64-w64-windows-gnu"
=======
target triple = "x86_64-unknown-linux-gnu"
>>>>>>> origin/main
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare void @"free"(i8* %".1")

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
  ;  Source: vergelijken('a',20)
  %".3" = sext i8 97 to i32
  %".4" = call float @"vergelijken"(i32 %".3", i32 20)
  ;  Source: floatboolean=vergelijken('a',20);
  store float %".4", float* %"boolean"
  %".7" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: boolean
  %"boolean.1" = load float, float* %"boolean"
  ;  Source: (int)boolean
  %".10" = fptosi float %"boolean.1" to i32
  ;  Source: printf("%d",(int)boolean);
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %".10")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"