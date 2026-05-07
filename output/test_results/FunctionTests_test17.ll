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

define void @"increment"()
{
entry:
  %"count" = alloca i32
  ;  Source: intcount=0;
  store i32 0, i32* %"count"
  %".4" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: count
  %"count.1" = load i32, i32* %"count"
  ;  Source: ++count
  %".7" = load i32, i32* %"count"
  %".8" = add i32 %".7", 1
  store i32 %".8", i32* %"count"
  ;  Source: printf("%d\n",++count);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".4", i32 %".8")
  ret void
}

@"str" = internal constant [4 x i8] c"%d\0a\00"
define i32 @"main"()
{
entry:
  ;  Source: increment();
  call void @"increment"()
  ;  Source: increment();
  call void @"increment"()
  ;  Source: increment();
  call void @"increment"()
  ;  Source: return0;
  ret i32 0
}
