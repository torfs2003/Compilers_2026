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
  %"radius" = alloca i32
  ;  Source: intradius=21;
  store i32 21, i32* %"radius"
  %"side" = alloca i32
  ;  Source: intside=5;
  store i32 5, i32* %"side"
  %"area" = alloca i32
  ;  Source: intarea;
  %"success" = alloca i32
  ;  Source: constintsuccess=1;
  store i32 1, i32* %"success"
  ;  Source: area
  %"area.1" = load i32, i32* %"area"
  ;  Source: area=3.14;
  %".11" = fptosi float 0x40091eb860000000 to i32
  store i32 %".11", i32* %"area"
  %".13" = bitcast [7 x i8]* @"str" to i8*
  ;  Source: radius
  %"radius.1" = load i32, i32* %"radius"
  ;  Source: area
  %"area.2" = load i32, i32* %"area"
  ;  Source: printf("%d%d%d",radius,area,success);
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 %"radius.1", i32 %"area.2", i32 1)
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [7 x i8] c"%d%d%d\00"