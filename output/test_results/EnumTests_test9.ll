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
  ;  Source: day
  %"day_load" = load i32, i32* %"day"
  ;  Source: day=Wed;
  store i32 2, i32* %"day"
  %".5" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: day
  %"day_load.1" = load i32, i32* %"day"
  ;  Source: printf("%d",day);
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %"day_load.1")
  ;  Source: if(day==Wed){day=Thur;}
  %"day_load.2" = load i32, i32* %"day"
  %".10" = icmp eq i32 %"day_load.2", 2
  %".11" = zext i1 %".10" to i32
  %"ifcond" = icmp ne i32 %".11", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
if.then:
  %"day_load.3" = load i32, i32* %"day"
  store i32 3, i32* %"day"
  br label %"if.end"
if.end:
  %".15" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: day
  %"day_load.4" = load i32, i32* %"day"
  ;  Source: printf("%d",day);
  %".18" = call i32 (i8*, ...) @"printf"(i8* %".15", i32 %"day_load.4")
  ;  Source: return0;
  ret i32 0
}

@"x" = internal global i32 1
@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"