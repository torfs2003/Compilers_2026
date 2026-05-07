; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.a" = type {i32}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"b" = alloca %"struct.a"
  ;  Source: structab;
  ;  Source: b.day
  %"gep_day" = getelementptr inbounds %"struct.a", %"struct.a"* %"b", i32 0, i32 0
  %"load_day" = load i32, i32* %"gep_day"
  ;  Source: b.day=Mon;
  store i32 0, i32* %"gep_day"
  %".6" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: b.day
  %"gep_day.1" = getelementptr inbounds %"struct.a", %"struct.a"* %"b", i32 0, i32 0
  %"load_day.1" = load i32, i32* %"gep_day.1"
  ;  Source: printf("%d",b.day);
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %"load_day.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"