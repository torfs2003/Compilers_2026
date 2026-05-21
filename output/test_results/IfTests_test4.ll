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
  %"r" = alloca i32
  store i32 5, i32* %"r"
  ;  Source: if(r){printf("%d",r);inta=0;printf("%d",a);if(6){intc=0;printf("%d",c);}intq=0;printf("%d",q);}
  %"r_load" = load i32, i32* %"r"
  %"ifcond" = icmp ne i32 %"r_load", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
if.then:
  %".5" = bitcast [3 x i8]* @"str" to i8*
  %"r_load.1" = load i32, i32* %"r"
  %".6" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %"r_load.1")
  %"a" = alloca i32
  store i32 0, i32* %"a"
  %".8" = bitcast [3 x i8]* @"str.1" to i8*
  %"a_load" = load i32, i32* %"a"
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"a_load")
  %"c" = alloca i32
  store i32 0, i32* %"c"
  %".11" = bitcast [3 x i8]* @"str.2" to i8*
  %"c_load" = load i32, i32* %"c"
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %"c_load")
  %"q" = alloca i32
  store i32 0, i32* %"q"
  %".14" = bitcast [3 x i8]* @"str.3" to i8*
  %"q_load" = load i32, i32* %"q"
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"q_load")
  br label %"if.end"
if.end:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"