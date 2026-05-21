; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  store i32 1, i32* %"a"
  %".3" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: ++a
  %".6" = load i32, i32* %"a"
  %".7" = add i32 %".6", 1
  store i32 %".7", i32* %"a"
  ;  Source: printf("%d",++a);
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %".7")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"