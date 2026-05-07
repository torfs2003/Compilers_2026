; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

define i32 @"main"()
{
entry:
  %"a" = alloca i8
  %".2" = trunc i32 0 to i8
  store i8 %".2", i8* %"a"
  %"b" = alloca i8
  %".4" = trunc i32 1 to i8
  store i8 %".4", i8* %"b"
  %".6" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: a
  %"a.1" = load i8, i8* %"a"
  ;  Source: b
  %"b.1" = load i8, i8* %"b"
  ;  Source: a&&b
  %".10" = icmp ne i8 %"a.1", 0
  %".11" = icmp ne i8 %"b.1", 0
  %".12" = and i1 %".10", %".11"
  %".13" = zext i1 %".12" to i32
  ;  Source: printf("%d",a&&b);
  %".15" = call i32 (i8*, ...) @"printf"(i8* %".6", i32 %".13")
  %".16" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: a
  %"a.2" = load i8, i8* %"a"
  ;  Source: b
  %"b.2" = load i8, i8* %"b"
  ;  Source: a||b
  %".20" = icmp ne i8 %"a.2", 0
  %".21" = icmp ne i8 %"b.2", 0
  %".22" = or i1 %".20", %".21"
  %".23" = zext i1 %".22" to i32
  ;  Source: printf("%d",a||b);
  %".25" = call i32 (i8*, ...) @"printf"(i8* %".16", i32 %".23")
  %".26" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: a
  %"a.3" = load i8, i8* %"a"
  ;  Source: b
  %"b.3" = load i8, i8* %"b"
  ;  Source: (a||b)
  %".30" = icmp ne i8 %"a.3", 0
  %".31" = icmp ne i8 %"b.3", 0
  %".32" = or i1 %".30", %".31"
  %".33" = zext i1 %".32" to i32
  ;  Source: !(a||b)
  %".35" = icmp eq i32 %".33", 0
  %".36" = zext i1 %".35" to i32
  ;  Source: printf("%d",!(a||b));
  %".38" = call i32 (i8*, ...) @"printf"(i8* %".26", i32 %".36")
  %"c" = alloca i8
  %".39" = trunc i32 0 to i8
  store i8 %".39", i8* %"c"
  %"d" = alloca i8
  %".41" = trunc i32 0 to i8
  store i8 %".41", i8* %"d"
  %".43" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: c
  %"c.1" = load i8, i8* %"c"
  ;  Source: d
  %"d.1" = load i8, i8* %"d"
  ;  Source: c&&d
  %".47" = icmp ne i8 %"c.1", 0
  %".48" = icmp ne i8 %"d.1", 0
  %".49" = and i1 %".47", %".48"
  %".50" = zext i1 %".49" to i32
  ;  Source: printf("%d",c&&d);
  %".52" = call i32 (i8*, ...) @"printf"(i8* %".43", i32 %".50")
  %".53" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: c
  %"c.2" = load i8, i8* %"c"
  ;  Source: d
  %"d.2" = load i8, i8* %"d"
  ;  Source: c||d
  %".57" = icmp ne i8 %"c.2", 0
  %".58" = icmp ne i8 %"d.2", 0
  %".59" = or i1 %".57", %".58"
  %".60" = zext i1 %".59" to i32
  ;  Source: printf("%d",c||d);
  %".62" = call i32 (i8*, ...) @"printf"(i8* %".53", i32 %".60")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"