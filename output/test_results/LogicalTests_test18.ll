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
  %"a" = alloca i32
  store i32 0, i32* %"a"
  %"b" = alloca i32
  store i32 0, i32* %"b"
  %"c" = alloca i32
  store i32 0, i32* %"c"
  %"d" = alloca i32
  store i32 0, i32* %"d"
  %"e" = alloca i32
  store i32 0, i32* %"e"
  %"f" = alloca i32
  store i32 0, i32* %"f"
  %"g" = alloca i32
  store i32 0, i32* %"g"
  %"h" = alloca i32
  store i32 0, i32* %"h"
  ;  Source: f
  %"f.1" = load i32, i32* %"f"
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: e
  %"e.1" = load i32, i32* %"e"
  ;  Source: d
  %"d.1" = load i32, i32* %"d"
  ;  Source: (d&&5<6)
  %".15" = icmp ne i32 %"d.1", 0
  %".16" = icmp ne i32 1, 0
  %".17" = and i1 %".15", %".16"
  %".18" = zext i1 %".17" to i32
  %".19" = icmp ne i32 %"e.1", 0
  %".20" = icmp ne i32 %".18", 0
  %".21" = and i1 %".19", %".20"
  %".22" = zext i1 %".21" to i32
  ;  Source: (a||e&&(d&&5<6))
  %".24" = icmp ne i32 %"a.1", 0
  %".25" = icmp ne i32 %".22", 0
  %".26" = or i1 %".24", %".25"
  %".27" = zext i1 %".26" to i32
  ;  Source: !(a||e&&(d&&5<6))
  %".29" = icmp eq i32 %".27", 0
  %".30" = zext i1 %".29" to i32
  ;  Source: f=!(a||e&&(d&&5<6));
  store i32 %".30", i32* %"f"
  %".33" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f
  %"f.2" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".36" = call i32 (i8*, ...) @"printf"(i8* %".33", i32 %"f.2")
  ;  Source: g
  %"g.1" = load i32, i32* %"g"
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: d
  %"d.2" = load i32, i32* %"d"
  %".40" = icmp slt i32 %"a.2", %"d.2"
  %".41" = zext i1 %".40" to i32
  ;  Source: e
  %"e.2" = load i32, i32* %"e"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  %".44" = icmp sge i32 %"e.2", %"b.1"
  %".45" = zext i1 %".44" to i32
  ;  Source: (a<d&&e>=b)
  %".47" = icmp ne i32 %".41", 0
  %".48" = icmp ne i32 %".45", 0
  %".49" = and i1 %".47", %".48"
  %".50" = zext i1 %".49" to i32
  ;  Source: g=(a<d&&e>=b);
  store i32 %".50", i32* %"g"
  %".53" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: g
  %"g.2" = load i32, i32* %"g"
  ;  Source: printf("%d",g);
  %".56" = call i32 (i8*, ...) @"printf"(i8* %".53", i32 %"g.2")
  ;  Source: h
  %"h.1" = load i32, i32* %"h"
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  %".60" = sub i32 %"a.3", %"b.2"
  ;  Source: d
  %"d.3" = load i32, i32* %"d"
  %".62" = icmp slt i32 %".60", %"d.3"
  %".63" = zext i1 %".62" to i32
  ;  Source: e
  %"e.3" = load i32, i32* %"e"
  ;  Source: g
  %"g.3" = load i32, i32* %"g"
  ;  Source: (e>g)
  %".67" = icmp sgt i32 %"e.3", %"g.3"
  %".68" = zext i1 %".67" to i32
  ;  Source: (!(e>g))
  %".70" = icmp eq i32 %".68", 0
  %".71" = zext i1 %".70" to i32
  ;  Source: (a-b<d&&(!(e>g)))
  %".73" = icmp ne i32 %".63", 0
  %".74" = icmp ne i32 %".71", 0
  %".75" = and i1 %".73", %".74"
  %".76" = zext i1 %".75" to i32
  ;  Source: h=(a-b<d&&(!(e>g)));
  store i32 %".76", i32* %"h"
  %".79" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: h
  %"h.2" = load i32, i32* %"h"
  ;  Source: printf("%d",h);
  %".82" = call i32 (i8*, ...) @"printf"(i8* %".79", i32 %"h.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"