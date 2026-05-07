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
  %"b" = alloca i32
  ;  Source: intb=5;
  store i32 5, i32* %"b"
  %"a" = alloca i32
  ;  Source: inta=3;
  store i32 3, i32* %"a"
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  %".8" = and i32 %"a.1", %"b.1"
  %".9" = and i32 %".8", 0
  ;  Source: a&&b&&0&&1;
  %".11" = and i32 %".9", 1
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  %".15" = and i32 %"a.3", %"b.2"
  %".16" = and i32 %".15", 0
  ;  Source: a&&b&&0&&1
  %".18" = and i32 %".16", 1
  ;  Source: a=a&&b&&0&&1;
  store i32 %".18", i32* %"a"
  %".21" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.4" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".24" = call i32 (i8*, ...) @"printf"(i8* %".21", i32 %"a.4")
  %".25" = bitcast [19 x i8]* @"str.1" to i8*
  ;  Source: a
  %"a.5" = load i32, i32* %"a"
  ;  Source: b
  %"b.3" = load i32, i32* %"b"
  %".28" = and i32 %"a.5", %"b.3"
  %".29" = and i32 %".28", 0
  ;  Source: a&&b&&0&&1
  %".31" = and i32 %".29", 1
  ;  Source: printf("........... %% %d ",a&&b&&0&&1);
  %".33" = call i32 (i8*, ...) @"printf"(i8* %".25", i32 %".31")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [19 x i8] c"........... %% %d \00"