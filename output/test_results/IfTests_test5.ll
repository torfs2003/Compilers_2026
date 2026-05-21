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
  %"a" = alloca i32
  store i32 1, i32* %"a"
  ;  Source: a
  %"a_load" = load i32, i32* %"a"
  ;  Source: a=3;
  store i32 3, i32* %"a"
  ;  Source: if(a){printf("%d",a);}
  %"a_load.1" = load i32, i32* %"a"
  %"ifcond" = icmp ne i32 %"a_load.1", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
if.then:
  %".8" = bitcast [3 x i8]* @"str" to i8*
  %"a_load.2" = load i32, i32* %"a"
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"a_load.2")
  br label %"if.end"
if.end:
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"