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
  ;  Source: a
  %"a.1" = load i32, i32* %"a"
  ;  Source: a=0;
  store i32 0, i32* %"a"
  ;  Source: b
  %"b.1" = load i32, i32* %"b"
  ;  Source: b=0;
  store i32 0, i32* %"b"
  ;  Source: c
  %"c.1" = load i32, i32* %"c"
  ;  Source: c=0;
  store i32 0, i32* %"c"
  ;  Source: d
  %"d.1" = load i32, i32* %"d"
  ;  Source: d=0;
  store i32 0, i32* %"d"
  ;  Source: e
  %"e.1" = load i32, i32* %"e"
  ;  Source: e=0;
  store i32 0, i32* %"e"
  ;  Source: f
  %"f.1" = load i32, i32* %"f"
  ;  Source: a
  %"a.2" = load i32, i32* %"a"
  ;  Source: e
  %"e.2" = load i32, i32* %"e"
  ;  Source: d
  %"d.2" = load i32, i32* %"d"
  ;  Source: (d&&5<6)
  %".38" = and i32 %"d.2", 1
  %".39" = and i32 %"e.2", %".38"
  ;  Source: (a||e&&(d&&5<6))
  %".41" = or i32 %"a.2", %".39"
  ;  Source: !(a||e&&(d&&5<6))
  %".43" = icmp eq i32 %".41", 0
  %".44" = zext i1 %".43" to i32
  ;  Source: f=!(a||e&&(d&&5<6));
  store i32 %".44", i32* %"f"
  %".47" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f
  %"f.2" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".50" = call i32 (i8*, ...) @"printf"(i8* %".47", i32 %"f.2")
  ;  Source: g
  %"g.1" = load i32, i32* %"g"
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: d
  %"d.3" = load i32, i32* %"d"
  %".54" = icmp slt i32 %"a.3", %"d.3"
  %".55" = zext i1 %".54" to i32
  ;  Source: e
  %"e.3" = load i32, i32* %"e"
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  %".58" = icmp sge i32 %"e.3", %"b.2"
  %".59" = zext i1 %".58" to i32
  ;  Source: (a<d&&e>=b)
  %".61" = and i32 %".55", %".59"
  ;  Source: g=(a<d&&e>=b);
  store i32 %".61", i32* %"g"
  %".64" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: g
  %"g.2" = load i32, i32* %"g"
  ;  Source: printf("%d",g);
  %".67" = call i32 (i8*, ...) @"printf"(i8* %".64", i32 %"g.2")
  ;  Source: h
  %"h.1" = load i32, i32* %"h"
  ;  Source: a
  %"a.4" = load i32, i32* %"a"
  ;  Source: b
  %"b.3" = load i32, i32* %"b"
  %".71" = sub i32 %"a.4", %"b.3"
  ;  Source: d
  %"d.4" = load i32, i32* %"d"
  %".73" = icmp slt i32 %".71", %"d.4"
  %".74" = zext i1 %".73" to i32
  ;  Source: e
  %"e.4" = load i32, i32* %"e"
  ;  Source: g
  %"g.3" = load i32, i32* %"g"
  ;  Source: (e>g)
  %".78" = icmp sgt i32 %"e.4", %"g.3"
  %".79" = zext i1 %".78" to i32
  ;  Source: (!(e>g))
  %".81" = icmp eq i32 %".79", 0
  %".82" = zext i1 %".81" to i32
  ;  Source: (a-b<d&&(!(e>g)))
  %".84" = and i32 %".74", %".82"
  ;  Source: h=(a-b<d&&(!(e>g)));
  store i32 %".84", i32* %"h"
  %".87" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: h
  %"h.2" = load i32, i32* %"h"
  ;  Source: printf("%d",h);
  %".90" = call i32 (i8*, ...) @"printf"(i8* %".87", i32 %"h.2")
  ;  Source: a
  %"a.5" = load i32, i32* %"a"
  ;  Source: a=0;
  store i32 0, i32* %"a"
  ;  Source: b
  %"b.4" = load i32, i32* %"b"
  ;  Source: b=1;
  store i32 1, i32* %"b"
  ;  Source: c
  %"c.2" = load i32, i32* %"c"
  ;  Source: c=0;
  store i32 0, i32* %"c"
  ;  Source: d
  %"d.5" = load i32, i32* %"d"
  ;  Source: d=1;
  store i32 1, i32* %"d"
  ;  Source: e
  %"e.5" = load i32, i32* %"e"
  ;  Source: e=0;
  store i32 0, i32* %"e"
  ;  Source: f
  %"f.3" = load i32, i32* %"f"
  ;  Source: a
  %"a.6" = load i32, i32* %"a"
  ;  Source: e
  %"e.6" = load i32, i32* %"e"
  ;  Source: d
  %"d.6" = load i32, i32* %"d"
  ;  Source: (d&&5<6)
  %".111" = and i32 %"d.6", 1
  %".112" = and i32 %"e.6", %".111"
  ;  Source: (a||e&&(d&&5<6))
  %".114" = or i32 %"a.6", %".112"
  ;  Source: !(a||e&&(d&&5<6))
  %".116" = icmp eq i32 %".114", 0
  %".117" = zext i1 %".116" to i32
  ;  Source: f=!(a||e&&(d&&5<6));
  store i32 %".117", i32* %"f"
  %".120" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: f
  %"f.4" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".123" = call i32 (i8*, ...) @"printf"(i8* %".120", i32 %"f.4")
  ;  Source: g
  %"g.4" = load i32, i32* %"g"
  ;  Source: a
  %"a.7" = load i32, i32* %"a"
  ;  Source: d
  %"d.7" = load i32, i32* %"d"
  %".127" = icmp slt i32 %"a.7", %"d.7"
  %".128" = zext i1 %".127" to i32
  ;  Source: e
  %"e.7" = load i32, i32* %"e"
  ;  Source: b
  %"b.5" = load i32, i32* %"b"
  %".131" = icmp sge i32 %"e.7", %"b.5"
  %".132" = zext i1 %".131" to i32
  ;  Source: (a<d&&e>=b)
  %".134" = and i32 %".128", %".132"
  ;  Source: g=(a<d&&e>=b);
  store i32 %".134", i32* %"g"
  %".137" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: g
  %"g.5" = load i32, i32* %"g"
  ;  Source: printf("%d",g);
  %".140" = call i32 (i8*, ...) @"printf"(i8* %".137", i32 %"g.5")
  ;  Source: h
  %"h.3" = load i32, i32* %"h"
  ;  Source: a
  %"a.8" = load i32, i32* %"a"
  ;  Source: b
  %"b.6" = load i32, i32* %"b"
  %".144" = sub i32 %"a.8", %"b.6"
  ;  Source: d
  %"d.8" = load i32, i32* %"d"
  %".146" = icmp slt i32 %".144", %"d.8"
  %".147" = zext i1 %".146" to i32
  ;  Source: e
  %"e.8" = load i32, i32* %"e"
  ;  Source: g
  %"g.6" = load i32, i32* %"g"
  ;  Source: (e>g)
  %".151" = icmp sgt i32 %"e.8", %"g.6"
  %".152" = zext i1 %".151" to i32
  ;  Source: (!(e>g))
  %".154" = icmp eq i32 %".152", 0
  %".155" = zext i1 %".154" to i32
  ;  Source: (a-b<d&&(!(e>g)))
  %".157" = and i32 %".147", %".155"
  ;  Source: h=(a-b<d&&(!(e>g)));
  store i32 %".157", i32* %"h"
  %".160" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: h
  %"h.4" = load i32, i32* %"h"
  ;  Source: printf("%d",h);
  %".163" = call i32 (i8*, ...) @"printf"(i8* %".160", i32 %"h.4")
  ;  Source: a
  %"a.9" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  ;  Source: b
  %"b.7" = load i32, i32* %"b"
  ;  Source: b=1;
  store i32 1, i32* %"b"
  ;  Source: c
  %"c.3" = load i32, i32* %"c"
  ;  Source: c=1;
  store i32 1, i32* %"c"
  ;  Source: d
  %"d.9" = load i32, i32* %"d"
  ;  Source: d=1;
  store i32 1, i32* %"d"
  ;  Source: e
  %"e.9" = load i32, i32* %"e"
  ;  Source: e=0;
  store i32 0, i32* %"e"
  ;  Source: f
  %"f.5" = load i32, i32* %"f"
  ;  Source: a
  %"a.10" = load i32, i32* %"a"
  ;  Source: e
  %"e.10" = load i32, i32* %"e"
  ;  Source: d
  %"d.10" = load i32, i32* %"d"
  ;  Source: (d&&5<6)
  %".184" = and i32 %"d.10", 1
  %".185" = and i32 %"e.10", %".184"
  ;  Source: (a||e&&(d&&5<6))
  %".187" = or i32 %"a.10", %".185"
  ;  Source: !(a||e&&(d&&5<6))
  %".189" = icmp eq i32 %".187", 0
  %".190" = zext i1 %".189" to i32
  ;  Source: f=!(a||e&&(d&&5<6));
  store i32 %".190", i32* %"f"
  %".193" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: f
  %"f.6" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".196" = call i32 (i8*, ...) @"printf"(i8* %".193", i32 %"f.6")
  ;  Source: g
  %"g.7" = load i32, i32* %"g"
  ;  Source: a
  %"a.11" = load i32, i32* %"a"
  ;  Source: d
  %"d.11" = load i32, i32* %"d"
  %".200" = icmp slt i32 %"a.11", %"d.11"
  %".201" = zext i1 %".200" to i32
  ;  Source: e
  %"e.11" = load i32, i32* %"e"
  ;  Source: b
  %"b.8" = load i32, i32* %"b"
  %".204" = icmp sge i32 %"e.11", %"b.8"
  %".205" = zext i1 %".204" to i32
  ;  Source: (a<d&&e>=b)
  %".207" = and i32 %".201", %".205"
  ;  Source: g=(a<d&&e>=b);
  store i32 %".207", i32* %"g"
  %".210" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: g
  %"g.8" = load i32, i32* %"g"
  ;  Source: printf("%d",g);
  %".213" = call i32 (i8*, ...) @"printf"(i8* %".210", i32 %"g.8")
  ;  Source: h
  %"h.5" = load i32, i32* %"h"
  ;  Source: a
  %"a.12" = load i32, i32* %"a"
  ;  Source: b
  %"b.9" = load i32, i32* %"b"
  %".217" = sub i32 %"a.12", %"b.9"
  ;  Source: d
  %"d.12" = load i32, i32* %"d"
  %".219" = icmp slt i32 %".217", %"d.12"
  %".220" = zext i1 %".219" to i32
  ;  Source: e
  %"e.12" = load i32, i32* %"e"
  ;  Source: g
  %"g.9" = load i32, i32* %"g"
  ;  Source: (e>g)
  %".224" = icmp sgt i32 %"e.12", %"g.9"
  %".225" = zext i1 %".224" to i32
  ;  Source: (!(e>g))
  %".227" = icmp eq i32 %".225", 0
  %".228" = zext i1 %".227" to i32
  ;  Source: (a-b<d&&(!(e>g)))
  %".230" = and i32 %".220", %".228"
  ;  Source: h=(a-b<d&&(!(e>g)));
  store i32 %".230", i32* %"h"
  %".233" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: h
  %"h.6" = load i32, i32* %"h"
  ;  Source: printf("%d",h);
  %".236" = call i32 (i8*, ...) @"printf"(i8* %".233", i32 %"h.6")
  ;  Source: a
  %"a.13" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  ;  Source: b
  %"b.10" = load i32, i32* %"b"
  ;  Source: b=0;
  store i32 0, i32* %"b"
  ;  Source: c
  %"c.4" = load i32, i32* %"c"
  ;  Source: c=0;
  store i32 0, i32* %"c"
  ;  Source: d
  %"d.13" = load i32, i32* %"d"
  ;  Source: d=1;
  store i32 1, i32* %"d"
  ;  Source: e
  %"e.13" = load i32, i32* %"e"
  ;  Source: e=0;
  store i32 0, i32* %"e"
  ;  Source: f
  %"f.7" = load i32, i32* %"f"
  ;  Source: a
  %"a.14" = load i32, i32* %"a"
  ;  Source: e
  %"e.14" = load i32, i32* %"e"
  ;  Source: d
  %"d.14" = load i32, i32* %"d"
  ;  Source: (d&&5<6)
  %".257" = and i32 %"d.14", 1
  %".258" = and i32 %"e.14", %".257"
  ;  Source: (a||e&&(d&&5<6))
  %".260" = or i32 %"a.14", %".258"
  ;  Source: !(a||e&&(d&&5<6))
  %".262" = icmp eq i32 %".260", 0
  %".263" = zext i1 %".262" to i32
  ;  Source: f=!(a||e&&(d&&5<6));
  store i32 %".263", i32* %"f"
  %".266" = bitcast [3 x i8]* @"str.9" to i8*
  ;  Source: f
  %"f.8" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".269" = call i32 (i8*, ...) @"printf"(i8* %".266", i32 %"f.8")
  ;  Source: g
  %"g.10" = load i32, i32* %"g"
  ;  Source: a
  %"a.15" = load i32, i32* %"a"
  ;  Source: d
  %"d.15" = load i32, i32* %"d"
  %".273" = icmp slt i32 %"a.15", %"d.15"
  %".274" = zext i1 %".273" to i32
  ;  Source: e
  %"e.15" = load i32, i32* %"e"
  ;  Source: b
  %"b.11" = load i32, i32* %"b"
  %".277" = icmp sge i32 %"e.15", %"b.11"
  %".278" = zext i1 %".277" to i32
  ;  Source: (a<d&&e>=b)
  %".280" = and i32 %".274", %".278"
  ;  Source: g=(a<d&&e>=b);
  store i32 %".280", i32* %"g"
  %".283" = bitcast [3 x i8]* @"str.10" to i8*
  ;  Source: g
  %"g.11" = load i32, i32* %"g"
  ;  Source: printf("%d",g);
  %".286" = call i32 (i8*, ...) @"printf"(i8* %".283", i32 %"g.11")
  ;  Source: h
  %"h.7" = load i32, i32* %"h"
  ;  Source: a
  %"a.16" = load i32, i32* %"a"
  ;  Source: b
  %"b.12" = load i32, i32* %"b"
  %".290" = sub i32 %"a.16", %"b.12"
  ;  Source: d
  %"d.16" = load i32, i32* %"d"
  %".292" = icmp slt i32 %".290", %"d.16"
  %".293" = zext i1 %".292" to i32
  ;  Source: e
  %"e.16" = load i32, i32* %"e"
  ;  Source: g
  %"g.12" = load i32, i32* %"g"
  ;  Source: (e>g)
  %".297" = icmp sgt i32 %"e.16", %"g.12"
  %".298" = zext i1 %".297" to i32
  ;  Source: (!(e>g))
  %".300" = icmp eq i32 %".298", 0
  %".301" = zext i1 %".300" to i32
  ;  Source: (a-b<d&&(!(e>g)))
  %".303" = and i32 %".293", %".301"
  ;  Source: h=(a-b<d&&(!(e>g)));
  store i32 %".303", i32* %"h"
  %".306" = bitcast [3 x i8]* @"str.11" to i8*
  ;  Source: h
  %"h.8" = load i32, i32* %"h"
  ;  Source: printf("%d",h);
  %".309" = call i32 (i8*, ...) @"printf"(i8* %".306", i32 %"h.8")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"
@"str.4" = internal constant [3 x i8] c"%d\00"
@"str.5" = internal constant [3 x i8] c"%d\00"
@"str.6" = internal constant [3 x i8] c"%d\00"
@"str.7" = internal constant [3 x i8] c"%d\00"
@"str.8" = internal constant [3 x i8] c"%d\00"
@"str.9" = internal constant [3 x i8] c"%d\00"
@"str.10" = internal constant [3 x i8] c"%d\00"
@"str.11" = internal constant [3 x i8] c"%d\00"