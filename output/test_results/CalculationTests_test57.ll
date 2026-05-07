; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"g"(i32 %".1")
{
entry:
  %"c" = alloca i32
  store i32 %".1", i32* %"c"
  %"d" = alloca i32
  %"c.1" = load i32, i32* %"c"
  %".4" = add i32 %"c.1", 5
  store i32 %".4", i32* %"d"
  ;  Source: returnc;
  %"c.2" = load i32, i32* %"c"
  ret i32 %"c.2"
}

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 5, i32* %"a"
  %"v" = alloca i32
  %"a.1" = load i32, i32* %"a"
  %".3" = call i32 @"g"(i32 %"a.1")
  store i32 %".3", i32* %"v"
  %".5" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: v
  %"v.1" = load i32, i32* %"v"
  ;  Source: printf("%d",v);
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %"v.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"