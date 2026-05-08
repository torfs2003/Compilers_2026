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
  %".2" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: printf("%d",1);
  %".4" = call i32 (i8*, ...) @"printf"(i8* %".2", i32 1)
  %"radius" = alloca i32
  store i32 21, i32* %"radius"
  %"side" = alloca i32
  store i32 5, i32* %"side"
  %"area" = alloca i32
  %"success" = alloca i32
  store i32 -20, i32* %"success"
  ;  Source: area
  %"area_load" = load i32, i32* %"area"
  ;  Source: area=3.14;
  %".10" = fptosi float 0x40091eb860000000 to i32
  store i32 %".10", i32* %"area"
  %".12" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: printf("%d",success);
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 -20)
  ;  Source: side
  %"side_load" = load i32, i32* %"side"
  ;  Source: side=7;
  store i32 7, i32* %"side"
  %".18" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: printf("%d",-20);
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 -20)
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"