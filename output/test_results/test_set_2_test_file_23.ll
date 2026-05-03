; ModuleID = "cmm_module"
target triple = "unknown-unknown-unknown"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx=5;
  store i32 5, i32* %"x"
  %"y" = alloca float
  ;  Source: floaty=0.5;
  store float 0x3fe0000000000000, float* %"y"
  %"c" = alloca i8
  ;  Source: charc='c';
  store i8 99, i8* %"c"
  %".8" = bitcast [11 x i8]* @"str" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: y
  %"y.1" = load float, float* %"y"
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: printf("%d; %f; %c",x,y,c);
  %".13" = fpext float %"y.1" to double
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"x.1", double %".13", i8 %"c.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [11 x i8] c"%d; %f; %c\00"