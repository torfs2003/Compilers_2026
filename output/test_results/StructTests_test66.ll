; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.MyStruct" = type {i32, float}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"intValue" = alloca i32
  ;  Source: intintValue=12345;
  store i32 12345, i32* %"intValue"
  %"myStruct" = alloca %"struct.MyStruct"
  ;  Source: intValue
  %"intValue.1" = load i32, i32* %"intValue"
  ;  Source: ((structMyStruct*)&intValue)
  %".6" = bitcast i32* %"intValue" to %"struct.MyStruct"*
  ;  Source: *((structMyStruct*)&intValue)
  ;  Source: structMyStructmyStruct=*((structMyStruct*)&intValue);
  %".9" = load %"struct.MyStruct", %"struct.MyStruct"* %".6"
  store %"struct.MyStruct" %".9", %"struct.MyStruct"* %"myStruct"
  %".11" = bitcast [19 x i8]* @"str" to i8*
  ;  Source: intValue
  %"intValue.2" = load i32, i32* %"intValue"
  ;  Source: printf("Integer value: %d\n",intValue);
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %"intValue.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [19 x i8] c"Integer value: %d\0a\00"