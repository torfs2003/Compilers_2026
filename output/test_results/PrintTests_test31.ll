; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"x" = alloca i32
  ;  Source: intx;
  ;  Source: x
  %"x.1" = load i32, i32* %"x"
  ;  Source: x=5;
  store i32 5, i32* %"x"
  %"y" = alloca float
  ;  Source: floaty;
  ;  Source: y
  %"y.1" = load float, float* %"y"
  ;  Source: y=0.5;
  store float 0x3fe0000000000000, float* %"y"
  %"c" = alloca i8
  ;  Source: charc;
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: c='c';
  store i8 99, i8* %"c"
  %".14" = bitcast [11 x i8]* @"str" to i8*
  ;  Source: x
  %"x.2" = load i32, i32* %"x"
  ;  Source: y
  %"y.2" = load float, float* %"y"
  ;  Source: (int)y
  %".18" = fptosi float %"y.2" to i32
  ;  Source: c
  %"c.2" = load i8, i8* %"c"
  ;  Source: printf("%d; %d; %c",x,(int)y,c);
  %".21" = zext i8 %"c.2" to i32
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %"x.2", i32 %".18", i32 %".21")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [11 x i8] c"%d; %d; %c\00"