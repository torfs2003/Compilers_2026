; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"d"()
{
entry:
  ;  Source: return6;
  ret i32 6
}

define float @"e"()
{
entry:
  ;  Source: return5.67;
  ret float 0x4016ae1480000000
}

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  %".2" = call i32 @"d"()
  store i32 %".2", i32* %"a"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a_load" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"a_load")
  ;  Source: a
  %"a_load.1" = load i32, i32* %"a"
  ;  Source: e()
  %".10" = call float @"e"()
  ;  Source: a=e();
  %".12" = fptosi float %".10" to i32
  store i32 %".12", i32* %"a"
  %".14" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: a
  %"a_load.2" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"a_load.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"