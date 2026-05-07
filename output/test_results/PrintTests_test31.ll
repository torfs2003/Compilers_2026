; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: x=5;
  store i32 5, i32* %"x"
  %"y" = alloca float
  ;  Source: y
  %"y.1" = load float, float* %"y"
  ;  Source: y=0.5;
  store float 0x3fe0000000000000, float* %"y"
  %"c" = alloca i8
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: c='c';
  store i8 99, i8* %"c"
  %".11" = bitcast [11 x i8]* @"str" to i8*
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: y
  %"y.2" = load float, float* %"y"
  ;  Source: (int)y
  %".15" = fptosi float %"y.2" to i32
  ;  Source: c
  %"c.2" = load i8, i8* %"c"
  ;  Source: printf("%d; %d; %c",x,(int)y,c);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %"x.2", i32 %".15", i8 %"c.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [11 x i8] c"%d; %d; %c\00"