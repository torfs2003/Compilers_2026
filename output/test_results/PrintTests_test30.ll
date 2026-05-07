; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  store i32 5, i32* %"x"
  %"y" = alloca float
  store float 0x3fe0000000000000, float* %"y"
  %"c" = alloca i8
  store i8 99, i8* %"c"
  %".5" = bitcast [11 x i8]* @"str" to i8*
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: y
  %"y.1" = load float, float* %"y"
  ;  Source: (int)y
  %".9" = fptosi float %"y.1" to i32
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: printf("%d; %d; %c",x,(int)y,c);
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %"x.1", i32 %".9", i8 %"c.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [11 x i8] c"%d; %d; %c\00"