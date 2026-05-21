; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 10, i32* %"x"
  %"y" = alloca i32
  ;  Source: y
  %"y_load" = load i32, i32* %"y"
  ;  Source: x
  %"x_load" = load i32, i32* %"x"
  ;  Source: y=x;
  store i32 %"x_load", i32* %"y"
  %"z" = alloca i32
  %"x_load.1" = load i32, i32* %"x"
  store i32 %"x_load.1", i32* %"z"
  %".8" = bitcast [11 x i8]* @"str" to i8*
  ;  Source: x
  %"x_load.2" = load i32, i32* %"x"
  ;  Source: y
  %"y_load.1" = load i32, i32* %"y"
  ;  Source: z
  %"z_load" = load i32, i32* %"z"
  ;  Source: printf("%d; %d; %d",x,y,z);
  %".13" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"x_load.2", i32 %"y_load.1", i32 %"z_load")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [11 x i8] c"%d; %d; %d\00"