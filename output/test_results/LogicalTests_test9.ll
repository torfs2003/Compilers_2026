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
  ;  Source: a=1;
  store i32 1, i32* %"a"
  %"f" = alloca i32
  ;  Source: f
  %"f_load" = load i32, i32* %"f"
  ;  Source: a
  %"a_load.1" = load i32, i32* %"a"
  ;  Source: !a
  %".9" = icmp eq i32 %"a_load.1", 0
  %".10" = zext i1 %".9" to i32
  ;  Source: f=!a;
  store i32 %".10", i32* %"f"
  %".13" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f
  %"f_load.1" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %"f_load.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"