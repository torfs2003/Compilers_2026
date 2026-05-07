; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.a" = type {i32}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"main"()
{
entry:
  %"b" = alloca %"struct.a"
  ;  Source: b.day
  %"gep_day" = getelementptr inbounds %"struct.a", %"struct.a"* %"b", i32 0, i32 0
  %"load_day" = load i32, i32* %"gep_day"
  ;  Source: b.day=Mon;
  store i32 0, i32* %"gep_day"
  %".5" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: b.day
  %"gep_day.1" = getelementptr inbounds %"struct.a", %"struct.a"* %"b", i32 0, i32 0
  %"load_day.1" = load i32, i32* %"gep_day.1"
  ;  Source: printf("%d",b.day);
  %".8" = call i32 (i8*, ...) @"printf"(i8* %".5", i32 %"load_day.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"