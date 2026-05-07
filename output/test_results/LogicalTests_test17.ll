; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

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
  %".30" = icmp ne i32 %"d.2", 0
  %".31" = icmp ne i32 1, 0
  %".32" = and i1 %".30", %".31"
  %".33" = zext i1 %".32" to i32
  %".34" = icmp ne i32 %"e.2", 0
  %".35" = icmp ne i32 %".33", 0
  %".36" = and i1 %".34", %".35"
  %".37" = zext i1 %".36" to i32
  ;  Source: (a||e&&(d&&5<6))
  %".39" = icmp ne i32 %"a.2", 0
  %".40" = icmp ne i32 %".37", 0
  %".41" = or i1 %".39", %".40"
  %".42" = zext i1 %".41" to i32
  ;  Source: !(a||e&&(d&&5<6))
  %".44" = icmp eq i32 %".42", 0
  %".45" = zext i1 %".44" to i32
  ;  Source: f=!(a||e&&(d&&5<6));
  store i32 %".45", i32* %"f"
  %".48" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f
  %"f.2" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".48", i32 %"f.2")
  ;  Source: g
  %"g.1" = load i32, i32* %"g"
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: d
  %"d.3" = load i32, i32* %"d"
  %".55" = icmp slt i32 %"a.3", %"d.3"
  %".56" = zext i1 %".55" to i32
  ;  Source: e
  %"e.3" = load i32, i32* %"e"
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  %".59" = icmp sge i32 %"e.3", %"b.2"
  %".60" = zext i1 %".59" to i32
  ;  Source: (a<d&&e>=b)
  %".62" = icmp ne i32 %".56", 0
  %".63" = icmp ne i32 %".60", 0
  %".64" = and i1 %".62", %".63"
  %".65" = zext i1 %".64" to i32
  ;  Source: g=(a<d&&e>=b);
  store i32 %".65", i32* %"g"
  %".68" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: g
  %"g.2" = load i32, i32* %"g"
  ;  Source: printf("%d",g);
  %".71" = call i32 (i8*, ...) @"printf"(i8* %".68", i32 %"g.2")
  ;  Source: h
  %"h.1" = load i32, i32* %"h"
  ;  Source: a
  %"a.4" = load i32, i32* %"a"
  ;  Source: b
  %"b.3" = load i32, i32* %"b"
  %".75" = sub i32 %"a.4", %"b.3"
  ;  Source: d
  %"d.4" = load i32, i32* %"d"
  %".77" = icmp slt i32 %".75", %"d.4"
  %".78" = zext i1 %".77" to i32
  ;  Source: e
  %"e.4" = load i32, i32* %"e"
  ;  Source: g
  %"g.3" = load i32, i32* %"g"
  ;  Source: (e>g)
  %".82" = icmp sgt i32 %"e.4", %"g.3"
  %".83" = zext i1 %".82" to i32
  ;  Source: (!(e>g))
  %".85" = icmp eq i32 %".83", 0
  %".86" = zext i1 %".85" to i32
  ;  Source: (a-b<d&&(!(e>g)))
  %".88" = icmp ne i32 %".78", 0
  %".89" = icmp ne i32 %".86", 0
  %".90" = and i1 %".88", %".89"
  %".91" = zext i1 %".90" to i32
  ;  Source: h=(a-b<d&&(!(e>g)));
  store i32 %".91", i32* %"h"
  %".94" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: h
  %"h.2" = load i32, i32* %"h"
  ;  Source: printf("%d",h);
  %".97" = call i32 (i8*, ...) @"printf"(i8* %".94", i32 %"h.2")
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
  %".118" = icmp ne i32 %"d.6", 0
  %".119" = icmp ne i32 1, 0
  %".120" = and i1 %".118", %".119"
  %".121" = zext i1 %".120" to i32
  %".122" = icmp ne i32 %"e.6", 0
  %".123" = icmp ne i32 %".121", 0
  %".124" = and i1 %".122", %".123"
  %".125" = zext i1 %".124" to i32
  ;  Source: (a||e&&(d&&5<6))
  %".127" = icmp ne i32 %"a.6", 0
  %".128" = icmp ne i32 %".125", 0
  %".129" = or i1 %".127", %".128"
  %".130" = zext i1 %".129" to i32
  ;  Source: !(a||e&&(d&&5<6))
  %".132" = icmp eq i32 %".130", 0
  %".133" = zext i1 %".132" to i32
  ;  Source: f=!(a||e&&(d&&5<6));
  store i32 %".133", i32* %"f"
  %".136" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: f
  %"f.4" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".139" = call i32 (i8*, ...) @"printf"(i8* %".136", i32 %"f.4")
  ;  Source: g
  %"g.4" = load i32, i32* %"g"
  ;  Source: a
  %"a.7" = load i32, i32* %"a"
  ;  Source: d
  %"d.7" = load i32, i32* %"d"
  %".143" = icmp slt i32 %"a.7", %"d.7"
  %".144" = zext i1 %".143" to i32
  ;  Source: e
  %"e.7" = load i32, i32* %"e"
  ;  Source: b
  %"b.5" = load i32, i32* %"b"
  %".147" = icmp sge i32 %"e.7", %"b.5"
  %".148" = zext i1 %".147" to i32
  ;  Source: (a<d&&e>=b)
  %".150" = icmp ne i32 %".144", 0
  %".151" = icmp ne i32 %".148", 0
  %".152" = and i1 %".150", %".151"
  %".153" = zext i1 %".152" to i32
  ;  Source: g=(a<d&&e>=b);
  store i32 %".153", i32* %"g"
  %".156" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: g
  %"g.5" = load i32, i32* %"g"
  ;  Source: printf("%d",g);
  %".159" = call i32 (i8*, ...) @"printf"(i8* %".156", i32 %"g.5")
  ;  Source: h
  %"h.3" = load i32, i32* %"h"
  ;  Source: a
  %"a.8" = load i32, i32* %"a"
  ;  Source: b
  %"b.6" = load i32, i32* %"b"
  %".163" = sub i32 %"a.8", %"b.6"
  ;  Source: d
  %"d.8" = load i32, i32* %"d"
  %".165" = icmp slt i32 %".163", %"d.8"
  %".166" = zext i1 %".165" to i32
  ;  Source: e
  %"e.8" = load i32, i32* %"e"
  ;  Source: g
  %"g.6" = load i32, i32* %"g"
  ;  Source: (e>g)
  %".170" = icmp sgt i32 %"e.8", %"g.6"
  %".171" = zext i1 %".170" to i32
  ;  Source: (!(e>g))
  %".173" = icmp eq i32 %".171", 0
  %".174" = zext i1 %".173" to i32
  ;  Source: (a-b<d&&(!(e>g)))
  %".176" = icmp ne i32 %".166", 0
  %".177" = icmp ne i32 %".174", 0
  %".178" = and i1 %".176", %".177"
  %".179" = zext i1 %".178" to i32
  ;  Source: h=(a-b<d&&(!(e>g)));
  store i32 %".179", i32* %"h"
  %".182" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: h
  %"h.4" = load i32, i32* %"h"
  ;  Source: printf("%d",h);
  %".185" = call i32 (i8*, ...) @"printf"(i8* %".182", i32 %"h.4")
  ;  Source: a
  %"a.9" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  ;  Source: b
  %"b.7" = load i32, i32* %"b"
  ;  Source: b=0;
  store i32 0, i32* %"b"
  ;  Source: c
  %"c.3" = load i32, i32* %"c"
  ;  Source: c=0;
  store i32 0, i32* %"c"
  ;  Source: d
  %"d.9" = load i32, i32* %"d"
  ;  Source: d=1;
  store i32 1, i32* %"d"
  ;  Source: e
  %"e.9" = load i32, i32* %"e"
  ;  Source: e=1;
  store i32 1, i32* %"e"
  ;  Source: f
  %"f.5" = load i32, i32* %"f"
  ;  Source: a
  %"a.10" = load i32, i32* %"a"
  ;  Source: e
  %"e.10" = load i32, i32* %"e"
  ;  Source: d
  %"d.10" = load i32, i32* %"d"
  ;  Source: (d&&5<6)
  %".206" = icmp ne i32 %"d.10", 0
  %".207" = icmp ne i32 1, 0
  %".208" = and i1 %".206", %".207"
  %".209" = zext i1 %".208" to i32
  %".210" = icmp ne i32 %"e.10", 0
  %".211" = icmp ne i32 %".209", 0
  %".212" = and i1 %".210", %".211"
  %".213" = zext i1 %".212" to i32
  ;  Source: (a||e&&(d&&5<6))
  %".215" = icmp ne i32 %"a.10", 0
  %".216" = icmp ne i32 %".213", 0
  %".217" = or i1 %".215", %".216"
  %".218" = zext i1 %".217" to i32
  ;  Source: !(a||e&&(d&&5<6))
  %".220" = icmp eq i32 %".218", 0
  %".221" = zext i1 %".220" to i32
  ;  Source: f=!(a||e&&(d&&5<6));
  store i32 %".221", i32* %"f"
  %".224" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: f
  %"f.6" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".227" = call i32 (i8*, ...) @"printf"(i8* %".224", i32 %"f.6")
  ;  Source: g
  %"g.7" = load i32, i32* %"g"
  ;  Source: a
  %"a.11" = load i32, i32* %"a"
  ;  Source: d
  %"d.11" = load i32, i32* %"d"
  %".231" = icmp slt i32 %"a.11", %"d.11"
  %".232" = zext i1 %".231" to i32
  ;  Source: e
  %"e.11" = load i32, i32* %"e"
  ;  Source: b
  %"b.8" = load i32, i32* %"b"
  %".235" = icmp sge i32 %"e.11", %"b.8"
  %".236" = zext i1 %".235" to i32
  ;  Source: (a<d&&e>=b)
  %".238" = icmp ne i32 %".232", 0
  %".239" = icmp ne i32 %".236", 0
  %".240" = and i1 %".238", %".239"
  %".241" = zext i1 %".240" to i32
  ;  Source: g=(a<d&&e>=b);
  store i32 %".241", i32* %"g"
  %".244" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: g
  %"g.8" = load i32, i32* %"g"
  ;  Source: printf("%d",g);
  %".247" = call i32 (i8*, ...) @"printf"(i8* %".244", i32 %"g.8")
  ;  Source: h
  %"h.5" = load i32, i32* %"h"
  ;  Source: a
  %"a.12" = load i32, i32* %"a"
  ;  Source: b
  %"b.9" = load i32, i32* %"b"
  %".251" = sub i32 %"a.12", %"b.9"
  ;  Source: d
  %"d.12" = load i32, i32* %"d"
  %".253" = icmp slt i32 %".251", %"d.12"
  %".254" = zext i1 %".253" to i32
  ;  Source: e
  %"e.12" = load i32, i32* %"e"
  ;  Source: g
  %"g.9" = load i32, i32* %"g"
  ;  Source: (e>g)
  %".258" = icmp sgt i32 %"e.12", %"g.9"
  %".259" = zext i1 %".258" to i32
  ;  Source: (!(e>g))
  %".261" = icmp eq i32 %".259", 0
  %".262" = zext i1 %".261" to i32
  ;  Source: (a-b<d&&(!(e>g)))
  %".264" = icmp ne i32 %".254", 0
  %".265" = icmp ne i32 %".262", 0
  %".266" = and i1 %".264", %".265"
  %".267" = zext i1 %".266" to i32
  ;  Source: h=(a-b<d&&(!(e>g)));
  store i32 %".267", i32* %"h"
  %".270" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: h
  %"h.6" = load i32, i32* %"h"
  ;  Source: printf("%d",h);
  %".273" = call i32 (i8*, ...) @"printf"(i8* %".270", i32 %"h.6")
  ;  Source: a
  %"a.13" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  ;  Source: b
  %"b.10" = load i32, i32* %"b"
  ;  Source: b=1;
  store i32 1, i32* %"b"
  ;  Source: c
  %"c.4" = load i32, i32* %"c"
  ;  Source: c=1;
  store i32 1, i32* %"c"
  ;  Source: d
  %"d.13" = load i32, i32* %"d"
  ;  Source: d=1;
  store i32 1, i32* %"d"
  ;  Source: e
  %"e.13" = load i32, i32* %"e"
  ;  Source: e=1;
  store i32 1, i32* %"e"
  ;  Source: f
  %"f.7" = load i32, i32* %"f"
  ;  Source: a
  %"a.14" = load i32, i32* %"a"
  ;  Source: e
  %"e.14" = load i32, i32* %"e"
  ;  Source: d
  %"d.14" = load i32, i32* %"d"
  ;  Source: (d&&5<6)
  %".294" = icmp ne i32 %"d.14", 0
  %".295" = icmp ne i32 1, 0
  %".296" = and i1 %".294", %".295"
  %".297" = zext i1 %".296" to i32
  %".298" = icmp ne i32 %"e.14", 0
  %".299" = icmp ne i32 %".297", 0
  %".300" = and i1 %".298", %".299"
  %".301" = zext i1 %".300" to i32
  ;  Source: (a||e&&(d&&5<6))
  %".303" = icmp ne i32 %"a.14", 0
  %".304" = icmp ne i32 %".301", 0
  %".305" = or i1 %".303", %".304"
  %".306" = zext i1 %".305" to i32
  ;  Source: !(a||e&&(d&&5<6))
  %".308" = icmp eq i32 %".306", 0
  %".309" = zext i1 %".308" to i32
  ;  Source: f=!(a||e&&(d&&5<6));
  store i32 %".309", i32* %"f"
  %".312" = bitcast [3 x i8]* @"str.9" to i8*
  ;  Source: f
  %"f.8" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".315" = call i32 (i8*, ...) @"printf"(i8* %".312", i32 %"f.8")
  ;  Source: g
  %"g.10" = load i32, i32* %"g"
  ;  Source: a
  %"a.15" = load i32, i32* %"a"
  ;  Source: d
  %"d.15" = load i32, i32* %"d"
  %".319" = icmp slt i32 %"a.15", %"d.15"
  %".320" = zext i1 %".319" to i32
  ;  Source: e
  %"e.15" = load i32, i32* %"e"
  ;  Source: b
  %"b.11" = load i32, i32* %"b"
  %".323" = icmp sge i32 %"e.15", %"b.11"
  %".324" = zext i1 %".323" to i32
  ;  Source: (a<d&&e>=b)
  %".326" = icmp ne i32 %".320", 0
  %".327" = icmp ne i32 %".324", 0
  %".328" = and i1 %".326", %".327"
  %".329" = zext i1 %".328" to i32
  ;  Source: g=(a<d&&e>=b);
  store i32 %".329", i32* %"g"
  %".332" = bitcast [3 x i8]* @"str.10" to i8*
  ;  Source: g
  %"g.11" = load i32, i32* %"g"
  ;  Source: printf("%d",g);
  %".335" = call i32 (i8*, ...) @"printf"(i8* %".332", i32 %"g.11")
  ;  Source: h
  %"h.7" = load i32, i32* %"h"
  ;  Source: a
  %"a.16" = load i32, i32* %"a"
  ;  Source: b
  %"b.12" = load i32, i32* %"b"
  %".339" = sub i32 %"a.16", %"b.12"
  ;  Source: d
  %"d.16" = load i32, i32* %"d"
  %".341" = icmp slt i32 %".339", %"d.16"
  %".342" = zext i1 %".341" to i32
  ;  Source: e
  %"e.16" = load i32, i32* %"e"
  ;  Source: g
  %"g.12" = load i32, i32* %"g"
  ;  Source: (e>g)
  %".346" = icmp sgt i32 %"e.16", %"g.12"
  %".347" = zext i1 %".346" to i32
  ;  Source: (!(e>g))
  %".349" = icmp eq i32 %".347", 0
  %".350" = zext i1 %".349" to i32
  ;  Source: (a-b<d&&(!(e>g)))
  %".352" = icmp ne i32 %".342", 0
  %".353" = icmp ne i32 %".350", 0
  %".354" = and i1 %".352", %".353"
  %".355" = zext i1 %".354" to i32
  ;  Source: h=(a-b<d&&(!(e>g)));
  store i32 %".355", i32* %"h"
  %".358" = bitcast [3 x i8]* @"str.11" to i8*
  ;  Source: h
  %"h.8" = load i32, i32* %"h"
  ;  Source: printf("%d",h);
  %".361" = call i32 (i8*, ...) @"printf"(i8* %".358", i32 %"h.8")
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