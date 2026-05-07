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

define i32 @"main"()
{
entry:
  %"k" = alloca i32
  ;  Source: intk=0;
  store i32 0, i32* %"k"
  %".4" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: k
  %"k.1" = load i32, i32* %"k"
  ;  Source: &k
  ;  Source: scanf("%x",&k);
  %".8" = call i32 (i8*, ...) @"scanf"(i8* %".4", i32* %"k")
  %".9" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: k
  %"k.2" = load i32, i32* %"k"
  ;  Source: printf("%x",k);
  %".12" = call i32 (i8*, ...) @"printf"(i8* %".9", i32 %"k.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%x\00"
@"str.1" = internal constant [3 x i8] c"%x\00"