; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"b" = alloca i32
  ;  Source: intb=0;
  store i32 0, i32* %"b"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: printf("%d",b);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"b.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"