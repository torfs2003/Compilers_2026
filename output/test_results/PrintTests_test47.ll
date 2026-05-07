; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 10, i32* %"x"
  %"x.1" = alloca i32
  store i32 20, i32* %"x.1"
  %".4" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: x
  %"x.2" = load i32, i32* %"x.1"
  ;  Source: printf("%d\n",x);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"x.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [4 x i8] c"%d\0a\00"