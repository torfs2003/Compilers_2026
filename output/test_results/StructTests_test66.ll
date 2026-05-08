; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.MyStruct" = type {i32, float}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"main"()
{
entry:
  %"intValue" = alloca i32
  store i32 12345, i32* %"intValue"
  %"myStruct" = alloca %"struct.MyStruct"
  %".3" = bitcast i32* %"intValue" to %"struct.MyStruct"*
  %".4" = load %"struct.MyStruct", %"struct.MyStruct"* %".3"
  store %"struct.MyStruct" %".4", %"struct.MyStruct"* %"myStruct"
  %".6" = bitcast [19 x i8]* @"str" to i8*
  ;  Source: intValue
  %"intValue_load" = load i32, i32* %"intValue"
  ;  Source: printf("Integer value: %d\n",intValue);
  %".9" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %"intValue_load")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [19 x i8] c"Integer value: %d\0a\00"