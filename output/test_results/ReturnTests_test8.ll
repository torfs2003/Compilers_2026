; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"d"(i32 %".1")
{
entry:
  %"a" = alloca i32
  store i32 %".1", i32* %"a"
  ;  Source: returna;
  %"a.1" = load i32, i32* %"a"
  ret i32 %"a.1"
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
  %".2" = call i32 @"d"(i32 5)
  store i32 %".2", i32* %"a"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"a.1")
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: e()
  %".10" = call float @"e"()
  ;  Source: a=e();
  %".12" = fptosi float %".10" to i32
  store i32 %".12", i32* %"a"
  %".14" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"a.3")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"