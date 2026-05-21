; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i8* @"malloc"(i32 %".1")

declare void @"free"(i8* %".1")

define i32 @"m"(i32 %".1")
{
entry:
  %"a" = alloca i32
  store i32 %".1", i32* %"a"
  ;  Source: return5;
  ret i32 5
}

define i32 @"main"()
{
entry:
  %"v" = alloca i32 (float)*
  %".2" = inttoptr i32 0 to i32 (float)*
  store i32 (float)* %".2", i32 (float)** %"v"
  ;  Source: int(*v)(float)=0;
  %".5" = inttoptr i32 0 to i32 (float)*
  store i32 (float)* %".5", i32 (float)** %"v"
  ;  Source: return0;
  ret i32 0
}
