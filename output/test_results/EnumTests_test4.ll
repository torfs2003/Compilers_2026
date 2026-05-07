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
  %"day.1" = load i32, i32* %"day"
  ;  Source: day=Wed;
  store i32 2, i32* %"day"
  %".6" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: day
  %"day.2" = load i32, i32* %"day"
  ;  Source: printf("%d",day);
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %"day.2")
  %".10" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: printf("%d",Mon);
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".10", i32 0)
  %"q" = alloca i32
  store i32 3, i32* %"q"
  %".14" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: printf("%d",Tue);
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 1)
  %".17" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: printf("%d",Thur);
  %".19" = call i32 (i8*, ...) @"printf"(i8* %".17", i32 3)
  %".20" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: printf("%d",Fri);
  %".22" = call i32 (i8*, ...) @"printf"(i8* %".20", i32 4)
  %".23" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: printf("%d",Sat);
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".23", i32 5)
  %".26" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: q
  %"q.1" = load i32, i32* %"q"
  ;  Source: printf("%d",q);
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 %"q.1")
  %".30" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: printf("%d",Sun);
  %".32" = call i32 (i8*, ...) @"printf"(i8* %".30", i32 6)
  ;  Source: q
  %"q.2" = load i32, i32* %"q"
  ;  Source: q=Sun;
  store i32 6, i32* %"q"
  %".36" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: q
  %"q.3" = load i32, i32* %"q"
  ;  Source: printf("%d",q);
  %".39" = call i32 (i8*, ...) @"printf"(i8* %".36", i32 %"q.3")
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
@"str.7" = internal constant [3 x i8] c"%d\00"
@"str.8" = internal constant [3 x i8] c"%d\00"