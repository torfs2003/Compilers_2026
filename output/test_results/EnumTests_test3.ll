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
  %"day" = alloca i32
  %"z" = alloca i32
  store i32 1, i32* %"z"
  ;  Source: day
  %"day_load" = load i32, i32* %"day"
  ;  Source: day=Wed;
  store i32 2, i32* %"day"
  %".6" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: day
  %"day_load.1" = load i32, i32* %"day"
  ;  Source: printf("%d",day);
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %"day_load.1")
  %".10" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: printf("%d",Mon);
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 0)
  %".13" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: printf("%d",Tue);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".13", i32 1)
  %".16" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: printf("%d",Thur);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 3)
  %".19" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: printf("%d",Fri);
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".19", i32 4)
  %".22" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: printf("%d",Sat);
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 5)
  %".25" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: printf("%d",Sun);
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 6)
  ;  Source: return0;
  ret i32 0
}

@"x" = internal global i32 1
@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"
@"str.5" = internal constant [3 x i8] c"%d\00"
@"str.6" = internal constant [3 x i8] c"%d\00"