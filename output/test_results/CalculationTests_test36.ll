; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

declare i8* @"fopen"(i8* %".1", i8* %".2")

declare i8* @"fgets"(i8* %".1", i32 %".2", i8* %".3")

declare i32 @"fputs"(i8* %".1", i8* %".2")

declare i32 @"fclose"(i8* %".1")

define i32 @"main"()
{
entry:
  %"a" = alloca i8
  %".2" = trunc i32 10 to i8
  store i8 %".2", i8* %"a"
  ;  Source: a
  %"a_load" = load i8, i8* %"a"
  ;  Source: a=10;
  %".6" = trunc i32 10 to i8
  store i8 %".6", i8* %"a"
  %"b" = alloca i8
  %".8" = trunc i32 245 to i8
  store i8 %".8", i8* %"b"
  ;  Source: b
  %"b_load" = load i8, i8* %"b"
  ;  Source: b=245;
  %".12" = trunc i32 245 to i8
  store i8 %".12", i8* %"b"
  %".14" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a_load.1" = load i8, i8* %"a"
  ;  Source: b
  %"b_load.1" = load i8, i8* %"b"
  ;  Source: a<b
  %".18" = icmp slt i8 %"a_load.1", %"b_load.1"
  %".19" = zext i1 %".18" to i32
  ;  Source: printf("%d",a<b);
  %".21" = call i32 (i8*, ...) @"printf"(i8* %".14", i32 %".19")
  %".22" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: a
  %"a_load.2" = load i8, i8* %"a"
  ;  Source: b
  %"b_load.2" = load i8, i8* %"b"
  ;  Source: a>b
  %".26" = icmp sgt i8 %"a_load.2", %"b_load.2"
  %".27" = zext i1 %".26" to i32
  ;  Source: printf("%d",a>b);
  %".29" = call i32 (i8*, ...) @"printf"(i8* %".22", i32 %".27")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"