; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define void @"increment"()
{
entry:
  %"count" = alloca i32
  store i32 0, i32* %"count"
  %".3" = bitcast [4 x i8]* @"str" to i8*
  ;  Source: count
  %"count_load" = load i32, i32* %"count"
  ;  Source: ++count
  %".6" = load i32, i32* %"count"
  %".7" = add i32 %".6", 1
  store i32 %".7", i32* %"count"
  ;  Source: printf("%d\n",++count);
  %".10" = call i32 (i8*, ...) @"printf"(i8* %".3", i32 %".7")
  ret void
}

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

@"str" = internal constant [4 x i8] c"%d\0a\00"