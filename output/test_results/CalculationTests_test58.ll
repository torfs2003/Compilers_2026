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

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

declare void @"free"(i8* %".1")

define i32 @"main"()
{
entry:
  %"a" = alloca i32
  ;  Source: inta=3;
  store i32 3, i32* %"a"
  %"b" = alloca i32
  ;  Source: intb=4;
  store i32 4, i32* %"b"
  %"c" = alloca i32
  ;  Source: intc=5;
  store i32 5, i32* %"c"
  %".8" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  ;  Source: printf("%d",c);
  %".11" = call i32 (i8*, ...) @"printf"(i8* %".8", i32 %"c.1")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"