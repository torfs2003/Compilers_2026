; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

%"struct.MyStruct" = type {i32, float}
declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"myStruct" = alloca %"struct.MyStruct"
  ;  Source: structMyStructmyStruct;
  %"intValue" = alloca i32
  ;  Source: myStruct
  ;  Source: ((int*)&myStruct)
  %".5" = bitcast %"struct.MyStruct"* %"myStruct" to i32*
  ;  Source: *((int*)&myStruct)
  %"deref_load" = load i32, i32* %".5"
  ;  Source: intintValue=*((int*)&myStruct);
  store i32 %"deref_load", i32* %"intValue"
  ;  Source: return0;
  ret i32 0
}
