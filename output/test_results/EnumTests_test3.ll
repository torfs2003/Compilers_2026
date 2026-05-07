; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

@"x" = internal global i32 1
define i32 @"main"()
{
entry:
  %"day" = alloca i32
  ;  Source: enumweekday;
  %"z" = alloca i32
  ;  Source: enumweekz=1;
  store i32 1, i32* %"z"
  ;  Source: day
  %"day.1" = load i32, i32* %"day"
  ;  Source: day=Wed;
  store i32 2, i32* %"day"
  %".8" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: day
  %"day.2" = load i32, i32* %"day"
  ;  Source: printf("%d",day);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"day.2")
  %".12" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: printf("%d",Mon);
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".12", i32 0)
  %".15" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: printf("%d",Tue);
  %".17" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 1)
  %".18" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: printf("%d",Thur);
  %".20" = call i32 (i8*, ...) @"printf"(i8* %".18", i32 3)
  %".21" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: printf("%d",Fri);
  %".23" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 4)
  %".24" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: printf("%d",Sat);
  %".26" = call i32 (i8*, ...) @"printf"(i8* %".24", i32 5)
  %".27" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: printf("%d",Sun);
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".27", i32 6)
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"
@"str.5" = internal constant [3 x i8] c"%d\00"
@"str.6" = internal constant [3 x i8] c"%d\00"