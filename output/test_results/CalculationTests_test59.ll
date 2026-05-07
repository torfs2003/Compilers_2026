; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"f"()
{
entry:
  %"b" = alloca i32
  ;  Source: intb=6;
  store i32 6, i32* %"b"
  ;  Source: return0;
  ret i32 0
}

define i32 @"main"()
{
entry:
  %"b" = alloca i32
  ;  Source: intb=5;
  store i32 5, i32* %"b"
  %"c" = alloca i32
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: intc=b;
  store i32 %"b.1", i32* %"c"
  %".7" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  ;  Source: printf("%d",c);
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".7", i32 %"c.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"