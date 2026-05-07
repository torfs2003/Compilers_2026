; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"d"(i32 %".1")
{
entry:
  %"w" = alloca i32
  store i32 %".1", i32* %"w"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: w
  %"w.1" = load i32, i32* %"w"
  ;  Source: printf("%d",w);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"w.1")
  ;  Source: returnw;
  %"w.2" = load i32, i32* %"w"
  ret i32 %"w.2"
}

@"str" = internal constant [3 x i8] c"%d\00"
define float @"e"()
{
entry:
  ;  Source: return5.67;
  ret float 0x4016ae1480000000
}

define i32 @"main"()
{
entry:
  %"b" = alloca i32
  store i32 6, i32* %"b"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: b=4;
  store i32 4, i32* %"b"
  %"a" = alloca i32
  %"b.2" = load i32, i32* %"b"
  %".6" = call i32 @"d"(i32 %"b.2")
  store i32 %".6", i32* %"a"
  %".8" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"a.1")
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: e()
  %".14" = call float @"e"()
  ;  Source: a=e();
  %".16" = fptosi float %".14" to i32
  store i32 %".16", i32* %"a"
  %".18" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 %"a.3")
  ;  Source: return0;
  ret i32 0
}

@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"