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
  ;  Source: inta=0;
  store i32 0, i32* %"a"
  %"b" = alloca i32
  ;  Source: intb=0;
  store i32 0, i32* %"b"
  %"c" = alloca i32
  ;  Source: intc=0;
  store i32 0, i32* %"c"
  %"d" = alloca i32
  ;  Source: intd=0;
  store i32 0, i32* %"d"
  %"e" = alloca i32
  ;  Source: inte=0;
  store i32 0, i32* %"e"
  %"f" = alloca i32
  ;  Source: intf=0;
  store i32 0, i32* %"f"
  %"g" = alloca i32
  ;  Source: intg=0;
  store i32 0, i32* %"g"
  %"h" = alloca i32
  ;  Source: inth=0;
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
  %".23" = icmp ne i32 %"d.1", 0
  %".24" = icmp ne i32 1, 0
  %".25" = and i1 %".23", %".24"
  %".26" = zext i1 %".25" to i32
  %".27" = icmp ne i32 %"e.1", 0
  %".28" = icmp ne i32 %".26", 0
  %".29" = and i1 %".27", %".28"
  %".30" = zext i1 %".29" to i32
  ;  Source: (a||e&&(d&&5<6))
  %".32" = icmp ne i32 %"a.1", 0
  %".33" = icmp ne i32 %".30", 0
  %".34" = or i1 %".32", %".33"
  %".35" = zext i1 %".34" to i32
  ;  Source: !(a||e&&(d&&5<6))
  %".37" = icmp eq i32 %".35", 0
  %".38" = zext i1 %".37" to i32
  ;  Source: f=!(a||e&&(d&&5<6));
  store i32 %".38", i32* %"f"
  %".41" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f
  %"f.2" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".44" = call i32 (i8*, ...) @"printf"(i8* %".41", i32 %"f.2")
  ;  Source: g
  %"g.1" = load i32, i32* %"g"
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: d
  %"d.2" = load i32, i32* %"d"
  %".48" = icmp slt i32 %"a.2", %"d.2"
  %".49" = zext i1 %".48" to i32
  ;  Source: e
  %"e.2" = load i32, i32* %"e"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  %".52" = icmp sge i32 %"e.2", %"b.1"
  %".53" = zext i1 %".52" to i32
  ;  Source: (a<d&&e>=b)
  %".55" = icmp ne i32 %".49", 0
  %".56" = icmp ne i32 %".53", 0
  %".57" = and i1 %".55", %".56"
  %".58" = zext i1 %".57" to i32
  ;  Source: g=(a<d&&e>=b);
  store i32 %".58", i32* %"g"
  %".61" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: g
  %"g.2" = load i32, i32* %"g"
  ;  Source: printf("%d",g);
  %".64" = call i32 (i8*, ...) @"printf"(i8* %".61", i32 %"g.2")
  ;  Source: h
  %"h.1" = load i32, i32* %"h"
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  %".68" = sub i32 %"a.3", %"b.2"
  ;  Source: d
  %"d.3" = load i32, i32* %"d"
  %".70" = icmp slt i32 %".68", %"d.3"
  %".71" = zext i1 %".70" to i32
  ;  Source: e
  %"e.3" = load i32, i32* %"e"
  ;  Source: g
  %"g.3" = load i32, i32* %"g"
  ;  Source: (e>g)
  %".75" = icmp sgt i32 %"e.3", %"g.3"
  %".76" = zext i1 %".75" to i32
  ;  Source: (!(e>g))
  %".78" = icmp eq i32 %".76", 0
  %".79" = zext i1 %".78" to i32
  ;  Source: (a-b<d&&(!(e>g)))
  %".81" = icmp ne i32 %".71", 0
  %".82" = icmp ne i32 %".79", 0
  %".83" = and i1 %".81", %".82"
  %".84" = zext i1 %".83" to i32
  ;  Source: h=(a-b<d&&(!(e>g)));
  store i32 %".84", i32* %"h"
  %".87" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: h
  %"h.2" = load i32, i32* %"h"
  ;  Source: printf("%d",h);
  %".90" = call i32 (i8*, ...) @"printf"(i8* %".87", i32 %"h.2")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"