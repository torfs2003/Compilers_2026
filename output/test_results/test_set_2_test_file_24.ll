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
  ;  Source: x
  %"x_load" = load i32, i32* %"x"
  ;  Source: x=5;
  store i32 5, i32* %"x"
  %"y" = alloca float
  ;  Source: y
  %"y_load" = load float, float* %"y"
  ;  Source: y=0.5;
  store float 0x3fe0000000000000, float* %"y"
  %"c" = alloca i8
  ;  Source: c
  %"c_load" = load i8, i8* %"c"
  ;  Source: c='c';
  store i8 99, i8* %"c"
  %".11" = bitcast [11 x i8]* @"str" to i8*
  ;  Source: x
  %"x_load.1" = load i32, i32* %"x"
  ;  Source: y
  %"y_load.1" = load float, float* %"y"
  ;  Source: c
  %"c_load.1" = load i8, i8* %"c"
  ;  Source: printf("%d; %f; %c",x,y,c);
  %".16" = fpext float %"y_load.1" to double
  %".17" = sext i8 %"c_load.1" to i32
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %"x_load.1", double %".16", i32 %".17")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [11 x i8] c"%d; %f; %c\00"