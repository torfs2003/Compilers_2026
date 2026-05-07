; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"foo"()
{
entry:
  %"x" = alloca i32
  store i32 3, i32* %"x"
  %"y" = alloca i32
  %"x.1" = load i32, i32* %"x"
  store i32 %"x.1", i32* %"y"
  %"z" = alloca i32
  ;  Source: z
  %"z.1" = load i32, i32* %"z"
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: z=x;
  store i32 %"x.2", i32* %"z"
  ;  Source: returnz;
  %"z.2" = load i32, i32* %"z"
  ret i32 %"z.2"
}

define i32 @"main"()
{
entry:
  %"temp" = alloca i32
  %".2" = call i32 @"foo"()
  store i32 %".2", i32* %"temp"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: temp
  %"temp.1" = load i32, i32* %"temp"
  ;  Source: printf("%d",temp);
  %".7" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %"temp.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"