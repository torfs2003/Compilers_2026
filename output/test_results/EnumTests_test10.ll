; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.Schedule" = type {i32}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

@"x" = internal global i32 1
define i32 @"main"()
{
entry:
  %"day" = alloca i32
  ;  Source: enumweekday;
  %"scheduler" = alloca %"struct.Schedule"
  ;  Source: structSchedulescheduler;
  ;  Source: scheduler.day_ptr
  %"gep_day_ptr" = getelementptr inbounds %"struct.Schedule", %"struct.Schedule"* %"scheduler", i32 0, i32 0
  %"union_cast_day_ptr" = bitcast i32* %"gep_day_ptr" to i32**
  %"load_day_ptr" = load i32*, i32** %"union_cast_day_ptr"
  ;  Source: day
  %"day.1" = load i32, i32* %"day"
  ;  Source: &day
  ;  Source: scheduler.day_ptr=&day;
  store i32* %"day", i32** %"union_cast_day_ptr"
  ;  Source: scheduler.day_ptr
  %"gep_day_ptr.1" = getelementptr inbounds %"struct.Schedule", %"struct.Schedule"* %"scheduler", i32 0, i32 0
  %"union_cast_day_ptr.1" = bitcast i32* %"gep_day_ptr.1" to i32**
  %"load_day_ptr.1" = load i32*, i32** %"union_cast_day_ptr.1"
  ;  Source: scheduler.day_ptr=Wed;
  %".11" = inttoptr i32 2 to i32*
  store i32* %".11", i32** %"union_cast_day_ptr.1"
  %".13" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: scheduler.day_ptr
  %"gep_day_ptr.2" = getelementptr inbounds %"struct.Schedule", %"struct.Schedule"* %"scheduler", i32 0, i32 0
  %"union_cast_day_ptr.2" = bitcast i32* %"gep_day_ptr.2" to i32**
  %"load_day_ptr.2" = load i32*, i32** %"union_cast_day_ptr.2"
  ;  Source: printf("%d",scheduler.day_ptr);
  %".16" = call i32 (i8*, ...) @"printf"(i8* %".13", i32* %"load_day_ptr.2")
  ;  Source: if(day==Wed){scheduler.day_ptr=Thur;}
  %"day.2" = load i32, i32* %"day"
  %".18" = icmp eq i32 %"day.2", 2
  %".19" = zext i1 %".18" to i32
  %"ifcond" = icmp ne i32 %".19", 0
  br i1 %"ifcond", label %"if.then", label %"if.end"
if.then:
  %"gep_day_ptr.3" = getelementptr inbounds %"struct.Schedule", %"struct.Schedule"* %"scheduler", i32 0, i32 0
  %"union_cast_day_ptr.3" = bitcast i32* %"gep_day_ptr.3" to i32**
  %"load_day_ptr.3" = load i32*, i32** %"union_cast_day_ptr.3"
  %".21" = inttoptr i32 3 to i32*
  store i32* %".21", i32** %"union_cast_day_ptr.3"
  br label %"if.end"
if.end:
  %".24" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: scheduler.day_ptr
  %"gep_day_ptr.4" = getelementptr inbounds %"struct.Schedule", %"struct.Schedule"* %"scheduler", i32 0, i32 0
  %"union_cast_day_ptr.4" = bitcast i32* %"gep_day_ptr.4" to i32**
  %"load_day_ptr.4" = load i32*, i32** %"union_cast_day_ptr.4"
  ;  Source: printf("%d",scheduler.day_ptr);
  %".27" = call i32 (i8*, ...) @"printf"(i8* %".24", i32* %"load_day_ptr.4")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"