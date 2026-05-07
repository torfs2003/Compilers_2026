; ModuleID = "cmm_module"
target triple = "x86_64-unknown-linux-gnu"
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
  %"a" = alloca i32
  ;  Source: inta=6;
  store i32 6, i32* %"a"
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: a=6;
  store i32 6, i32* %"a"
  %"b" = alloca i32
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: +a
  ;  Source: intb=+a;
  store i32 %"a.2", i32* %"b"
  %".11" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: printf("%d",b);
  %".14" = call i32 (i8*, ...) @"printf"(i8* %".11", i32 %"b.1")
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: -a
  %".18" = sub i32 0, %"a.3"
  ;  Source: b=-a;
  store i32 %".18", i32* %"b"
  %".21" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: b
  %"b.3" = load i32, i32* %"b"
  ;  Source: printf("%d",b);
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %"b.3")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"