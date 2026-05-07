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
  %".8" = icmp ne i32 %"a.1", 0
  %".9" = icmp ne i32 %"b.1", 0
  %".10" = and i1 %".8", %".9"
  %".11" = zext i1 %".10" to i32
  %".12" = icmp ne i32 %".11", 0
  %".13" = icmp ne i32 0, 0
  %".14" = and i1 %".12", %".13"
  %".15" = zext i1 %".14" to i32
  ;  Source: a&&b&&0&&1;
  %".17" = icmp ne i32 %".15", 0
  %".18" = icmp ne i32 1, 0
  %".19" = and i1 %".17", %".18"
  %".20" = zext i1 %".19" to i32
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  %".24" = icmp ne i32 %"a.3", 0
  %".25" = icmp ne i32 %"b.2", 0
  %".26" = and i1 %".24", %".25"
  %".27" = zext i1 %".26" to i32
  %".28" = icmp ne i32 %".27", 0
  %".29" = icmp ne i32 0, 0
  %".30" = and i1 %".28", %".29"
  %".31" = zext i1 %".30" to i32
  ;  Source: a&&b&&0&&1
  %".33" = icmp ne i32 %".31", 0
  %".34" = icmp ne i32 1, 0
  %".35" = and i1 %".33", %".34"
  %".36" = zext i1 %".35" to i32
  ;  Source: a=a&&b&&0&&1;
  store i32 %".36", i32* %"a"
  %".39" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.4" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".42" = call i32 (i8*, ...) @"printf"(i8* %".39", i32 %"a.4")
  %".43" = bitcast [19 x i8]* @"str.1" to i8*
  ;  Source: a
  %"a.5" = load i32, i32* %"a"
  ;  Source: b
  %"b.3" = load i32, i32* %"b"
  %".46" = icmp ne i32 %"a.5", 0
  %".47" = icmp ne i32 %"b.3", 0
  %".48" = and i1 %".46", %".47"
  %".49" = zext i1 %".48" to i32
  %".50" = icmp ne i32 %".49", 0
  %".51" = icmp ne i32 0, 0
  %".52" = and i1 %".50", %".51"
  %".53" = zext i1 %".52" to i32
  ;  Source: a&&b&&0&&1
  %".55" = icmp ne i32 %".53", 0
  %".56" = icmp ne i32 1, 0
  %".57" = and i1 %".55", %".56"
  %".58" = zext i1 %".57" to i32
  ;  Source: printf("........... %% %d ",a&&b&&0&&1);
  %".60" = call i32 (i8*, ...) @"printf"(i8* %".43", i32 %".58")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [19 x i8] c"........... %% %d \00"