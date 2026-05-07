; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 6, i32* %"a"
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: a=6;
  store i32 6, i32* %"a"
  %"b" = alloca i32
  %"a.2" = load i32, i32* %"a"
  store i32 %"a.2", i32* %"b"
  %".7" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: printf("%d",b);
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %"b.1")
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: -a
  %".14" = sub i32 0, %"a.3"
  ;  Source: b=-a;
  store i32 %".14", i32* %"b"
  %".17" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: b
  %"b.3" = load i32, i32* %"b"
  ;  Source: printf("%d",b);
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".17", i32 %"b.3")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"