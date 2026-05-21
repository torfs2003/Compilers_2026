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
  %"b" = alloca i32
  store i32 5, i32* %"b"
  %"a" = alloca i32
  store i32 3, i32* %"a"
  ;  Source: a
  %"a_load" = load i32, i32* %"a"
  ;  Source: b
  %"b_load" = load i32, i32* %"b"
  %".6" = icmp ne i32 %"a_load", 0
  %".7" = icmp ne i32 %"b_load", 0
  %".8" = and i1 %".6", %".7"
  %".9" = zext i1 %".8" to i32
  %".10" = icmp ne i32 %".9", 0
  %".11" = icmp ne i32 0, 0
  %".12" = and i1 %".10", %".11"
  %".13" = zext i1 %".12" to i32
  ;  Source: a&&b&&0&&1;
  %".15" = icmp ne i32 %".13", 0
  %".16" = icmp ne i32 1, 0
  %".17" = and i1 %".15", %".16"
  %".18" = zext i1 %".17" to i32
  ;  Source: a
  %"a_load.1" = load i32, i32* %"a"
  ;  Source: a
  %"a_load.2" = load i32, i32* %"a"
  ;  Source: b
  %"b_load.1" = load i32, i32* %"b"
  %".22" = icmp ne i32 %"a_load.2", 0
  %".23" = icmp ne i32 %"b_load.1", 0
  %".24" = and i1 %".22", %".23"
  %".25" = zext i1 %".24" to i32
  %".26" = icmp ne i32 %".25", 0
  %".27" = icmp ne i32 0, 0
  %".28" = and i1 %".26", %".27"
  %".29" = zext i1 %".28" to i32
  ;  Source: a&&b&&0&&1
  %".31" = icmp ne i32 %".29", 0
  %".32" = icmp ne i32 1, 0
  %".33" = and i1 %".31", %".32"
  %".34" = zext i1 %".33" to i32
  ;  Source: a=a&&b&&0&&1;
  store i32 %".34", i32* %"a"
  %".37" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a_load.3" = load i32, i32* %"a"
  ;  Source: printf("%d",a);
  %".40" = call i32 (i8*, ...) @"printf"(i8* %".37", i32 %"a_load.3")
  %".41" = bitcast [19 x i8]* @"str.1" to i8*
  ;  Source: a
  %"a_load.4" = load i32, i32* %"a"
  ;  Source: b
  %"b_load.2" = load i32, i32* %"b"
  %".44" = icmp ne i32 %"a_load.4", 0
  %".45" = icmp ne i32 %"b_load.2", 0
  %".46" = and i1 %".44", %".45"
  %".47" = zext i1 %".46" to i32
  %".48" = icmp ne i32 %".47", 0
  %".49" = icmp ne i32 0, 0
  %".50" = and i1 %".48", %".49"
  %".51" = zext i1 %".50" to i32
  ;  Source: a&&b&&0&&1
  %".53" = icmp ne i32 %".51", 0
  %".54" = icmp ne i32 1, 0
  %".55" = and i1 %".53", %".54"
  %".56" = zext i1 %".55" to i32
  ;  Source: printf("........... %% %d ",a&&b&&0&&1);
  %".58" = call i32 (i8*, ...) @"printf"(i8* %".41", i32 %".56")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [19 x i8] c"........... %% %d \00"