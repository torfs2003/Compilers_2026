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
  %".38" = icmp ne i32 %"d.2", 0
  %".39" = icmp ne i32 1, 0
  %".40" = and i1 %".38", %".39"
  %".41" = zext i1 %".40" to i32
  %".42" = icmp ne i32 %"e.2", 0
  %".43" = icmp ne i32 %".41", 0
  %".44" = and i1 %".42", %".43"
  %".45" = zext i1 %".44" to i32
  ;  Source: (a||e&&(d&&5<6))
  %".47" = icmp ne i32 %"a.2", 0
  %".48" = icmp ne i32 %".45", 0
  %".49" = or i1 %".47", %".48"
  %".50" = zext i1 %".49" to i32
  ;  Source: !(a||e&&(d&&5<6))
  %".52" = icmp eq i32 %".50", 0
  %".53" = zext i1 %".52" to i32
  ;  Source: f=!(a||e&&(d&&5<6));
  store i32 %".53", i32* %"f"
  %".56" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f
  %"f.2" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".56", i32 %"f.2")
  ;  Source: g
  %"g.1" = load i32, i32* %"g"
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: d
  %"d.3" = load i32, i32* %"d"
  %".63" = icmp slt i32 %"a.3", %"d.3"
  %".64" = zext i1 %".63" to i32
  ;  Source: e
  %"e.3" = load i32, i32* %"e"
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  %".67" = icmp sge i32 %"e.3", %"b.2"
  %".68" = zext i1 %".67" to i32
  ;  Source: (a<d&&e>=b)
  %".70" = icmp ne i32 %".64", 0
  %".71" = icmp ne i32 %".68", 0
  %".72" = and i1 %".70", %".71"
  %".73" = zext i1 %".72" to i32
  ;  Source: g=(a<d&&e>=b);
  store i32 %".73", i32* %"g"
  %".76" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: g
  %"g.2" = load i32, i32* %"g"
  ;  Source: printf("%d",g);
  %".79" = call i32 (i8*, ...) @"printf"(i8* %".76", i32 %"g.2")
  ;  Source: h
  %"h.1" = load i32, i32* %"h"
  ;  Source: a
  %"a.4" = load i32, i32* %"a"
  ;  Source: b
  %"b.3" = load i32, i32* %"b"
  %".83" = sub i32 %"a.4", %"b.3"
  ;  Source: d
  %"d.4" = load i32, i32* %"d"
  %".85" = icmp slt i32 %".83", %"d.4"
  %".86" = zext i1 %".85" to i32
  ;  Source: e
  %"e.4" = load i32, i32* %"e"
  ;  Source: g
  %"g.3" = load i32, i32* %"g"
  ;  Source: (e>g)
  %".90" = icmp sgt i32 %"e.4", %"g.3"
  %".91" = zext i1 %".90" to i32
  ;  Source: (!(e>g))
  %".93" = icmp eq i32 %".91", 0
  %".94" = zext i1 %".93" to i32
  ;  Source: (a-b<d&&(!(e>g)))
  %".96" = icmp ne i32 %".86", 0
  %".97" = icmp ne i32 %".94", 0
  %".98" = and i1 %".96", %".97"
  %".99" = zext i1 %".98" to i32
  ;  Source: h=(a-b<d&&(!(e>g)));
  store i32 %".99", i32* %"h"
  %".102" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: h
  %"h.2" = load i32, i32* %"h"
  ;  Source: printf("%d",h);
  %".105" = call i32 (i8*, ...) @"printf"(i8* %".102", i32 %"h.2")
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
  %".126" = icmp ne i32 %"d.6", 0
  %".127" = icmp ne i32 1, 0
  %".128" = and i1 %".126", %".127"
  %".129" = zext i1 %".128" to i32
  %".130" = icmp ne i32 %"e.6", 0
  %".131" = icmp ne i32 %".129", 0
  %".132" = and i1 %".130", %".131"
  %".133" = zext i1 %".132" to i32
  ;  Source: (a||e&&(d&&5<6))
  %".135" = icmp ne i32 %"a.6", 0
  %".136" = icmp ne i32 %".133", 0
  %".137" = or i1 %".135", %".136"
  %".138" = zext i1 %".137" to i32
  ;  Source: !(a||e&&(d&&5<6))
  %".140" = icmp eq i32 %".138", 0
  %".141" = zext i1 %".140" to i32
  ;  Source: f=!(a||e&&(d&&5<6));
  store i32 %".141", i32* %"f"
  %".144" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: f
  %"f.4" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".147" = call i32 (i8*, ...) @"printf"(i8* %".144", i32 %"f.4")
  ;  Source: g
  %"g.4" = load i32, i32* %"g"
  ;  Source: a
  %"a.7" = load i32, i32* %"a"
  ;  Source: d
  %"d.7" = load i32, i32* %"d"
  %".151" = icmp slt i32 %"a.7", %"d.7"
  %".152" = zext i1 %".151" to i32
  ;  Source: e
  %"e.7" = load i32, i32* %"e"
  ;  Source: b
  %"b.5" = load i32, i32* %"b"
  %".155" = icmp sge i32 %"e.7", %"b.5"
  %".156" = zext i1 %".155" to i32
  ;  Source: (a<d&&e>=b)
  %".158" = icmp ne i32 %".152", 0
  %".159" = icmp ne i32 %".156", 0
  %".160" = and i1 %".158", %".159"
  %".161" = zext i1 %".160" to i32
  ;  Source: g=(a<d&&e>=b);
  store i32 %".161", i32* %"g"
  %".164" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: g
  %"g.5" = load i32, i32* %"g"
  ;  Source: printf("%d",g);
  %".167" = call i32 (i8*, ...) @"printf"(i8* %".164", i32 %"g.5")
  ;  Source: h
  %"h.3" = load i32, i32* %"h"
  ;  Source: a
  %"a.8" = load i32, i32* %"a"
  ;  Source: b
  %"b.6" = load i32, i32* %"b"
  %".171" = sub i32 %"a.8", %"b.6"
  ;  Source: d
  %"d.8" = load i32, i32* %"d"
  %".173" = icmp slt i32 %".171", %"d.8"
  %".174" = zext i1 %".173" to i32
  ;  Source: e
  %"e.8" = load i32, i32* %"e"
  ;  Source: g
  %"g.6" = load i32, i32* %"g"
  ;  Source: (e>g)
  %".178" = icmp sgt i32 %"e.8", %"g.6"
  %".179" = zext i1 %".178" to i32
  ;  Source: (!(e>g))
  %".181" = icmp eq i32 %".179", 0
  %".182" = zext i1 %".181" to i32
  ;  Source: (a-b<d&&(!(e>g)))
  %".184" = icmp ne i32 %".174", 0
  %".185" = icmp ne i32 %".182", 0
  %".186" = and i1 %".184", %".185"
  %".187" = zext i1 %".186" to i32
  ;  Source: h=(a-b<d&&(!(e>g)));
  store i32 %".187", i32* %"h"
  %".190" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: h
  %"h.4" = load i32, i32* %"h"
  ;  Source: printf("%d",h);
  %".193" = call i32 (i8*, ...) @"printf"(i8* %".190", i32 %"h.4")
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
  %".214" = icmp ne i32 %"d.10", 0
  %".215" = icmp ne i32 1, 0
  %".216" = and i1 %".214", %".215"
  %".217" = zext i1 %".216" to i32
  %".218" = icmp ne i32 %"e.10", 0
  %".219" = icmp ne i32 %".217", 0
  %".220" = and i1 %".218", %".219"
  %".221" = zext i1 %".220" to i32
  ;  Source: (a||e&&(d&&5<6))
  %".223" = icmp ne i32 %"a.10", 0
  %".224" = icmp ne i32 %".221", 0
  %".225" = or i1 %".223", %".224"
  %".226" = zext i1 %".225" to i32
  ;  Source: !(a||e&&(d&&5<6))
  %".228" = icmp eq i32 %".226", 0
  %".229" = zext i1 %".228" to i32
  ;  Source: f=!(a||e&&(d&&5<6));
  store i32 %".229", i32* %"f"
  %".232" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: f
  %"f.6" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".235" = call i32 (i8*, ...) @"printf"(i8* %".232", i32 %"f.6")
  ;  Source: g
  %"g.7" = load i32, i32* %"g"
  ;  Source: a
  %"a.11" = load i32, i32* %"a"
  ;  Source: d
  %"d.11" = load i32, i32* %"d"
  %".239" = icmp slt i32 %"a.11", %"d.11"
  %".240" = zext i1 %".239" to i32
  ;  Source: e
  %"e.11" = load i32, i32* %"e"
  ;  Source: b
  %"b.8" = load i32, i32* %"b"
  %".243" = icmp sge i32 %"e.11", %"b.8"
  %".244" = zext i1 %".243" to i32
  ;  Source: (a<d&&e>=b)
  %".246" = icmp ne i32 %".240", 0
  %".247" = icmp ne i32 %".244", 0
  %".248" = and i1 %".246", %".247"
  %".249" = zext i1 %".248" to i32
  ;  Source: g=(a<d&&e>=b);
  store i32 %".249", i32* %"g"
  %".252" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: g
  %"g.8" = load i32, i32* %"g"
  ;  Source: printf("%d",g);
  %".255" = call i32 (i8*, ...) @"printf"(i8* %".252", i32 %"g.8")
  ;  Source: h
  %"h.5" = load i32, i32* %"h"
  ;  Source: a
  %"a.12" = load i32, i32* %"a"
  ;  Source: b
  %"b.9" = load i32, i32* %"b"
  %".259" = sub i32 %"a.12", %"b.9"
  ;  Source: d
  %"d.12" = load i32, i32* %"d"
  %".261" = icmp slt i32 %".259", %"d.12"
  %".262" = zext i1 %".261" to i32
  ;  Source: e
  %"e.12" = load i32, i32* %"e"
  ;  Source: g
  %"g.9" = load i32, i32* %"g"
  ;  Source: (e>g)
  %".266" = icmp sgt i32 %"e.12", %"g.9"
  %".267" = zext i1 %".266" to i32
  ;  Source: (!(e>g))
  %".269" = icmp eq i32 %".267", 0
  %".270" = zext i1 %".269" to i32
  ;  Source: (a-b<d&&(!(e>g)))
  %".272" = icmp ne i32 %".262", 0
  %".273" = icmp ne i32 %".270", 0
  %".274" = and i1 %".272", %".273"
  %".275" = zext i1 %".274" to i32
  ;  Source: h=(a-b<d&&(!(e>g)));
  store i32 %".275", i32* %"h"
  %".278" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: h
  %"h.6" = load i32, i32* %"h"
  ;  Source: printf("%d",h);
  %".281" = call i32 (i8*, ...) @"printf"(i8* %".278", i32 %"h.6")
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
  %".302" = icmp ne i32 %"d.14", 0
  %".303" = icmp ne i32 1, 0
  %".304" = and i1 %".302", %".303"
  %".305" = zext i1 %".304" to i32
  %".306" = icmp ne i32 %"e.14", 0
  %".307" = icmp ne i32 %".305", 0
  %".308" = and i1 %".306", %".307"
  %".309" = zext i1 %".308" to i32
  ;  Source: (a||e&&(d&&5<6))
  %".311" = icmp ne i32 %"a.14", 0
  %".312" = icmp ne i32 %".309", 0
  %".313" = or i1 %".311", %".312"
  %".314" = zext i1 %".313" to i32
  ;  Source: !(a||e&&(d&&5<6))
  %".316" = icmp eq i32 %".314", 0
  %".317" = zext i1 %".316" to i32
  ;  Source: f=!(a||e&&(d&&5<6));
  store i32 %".317", i32* %"f"
  %".320" = bitcast [3 x i8]* @"str.9" to i8*
  ;  Source: f
  %"f.8" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".323" = call i32 (i8*, ...) @"printf"(i8* %".320", i32 %"f.8")
  ;  Source: g
  %"g.10" = load i32, i32* %"g"
  ;  Source: a
  %"a.15" = load i32, i32* %"a"
  ;  Source: d
  %"d.15" = load i32, i32* %"d"
  %".327" = icmp slt i32 %"a.15", %"d.15"
  %".328" = zext i1 %".327" to i32
  ;  Source: e
  %"e.15" = load i32, i32* %"e"
  ;  Source: b
  %"b.11" = load i32, i32* %"b"
  %".331" = icmp sge i32 %"e.15", %"b.11"
  %".332" = zext i1 %".331" to i32
  ;  Source: (a<d&&e>=b)
  %".334" = icmp ne i32 %".328", 0
  %".335" = icmp ne i32 %".332", 0
  %".336" = and i1 %".334", %".335"
  %".337" = zext i1 %".336" to i32
  ;  Source: g=(a<d&&e>=b);
  store i32 %".337", i32* %"g"
  %".340" = bitcast [3 x i8]* @"str.10" to i8*
  ;  Source: g
  %"g.11" = load i32, i32* %"g"
  ;  Source: printf("%d",g);
  %".343" = call i32 (i8*, ...) @"printf"(i8* %".340", i32 %"g.11")
  ;  Source: h
  %"h.7" = load i32, i32* %"h"
  ;  Source: a
  %"a.16" = load i32, i32* %"a"
  ;  Source: b
  %"b.12" = load i32, i32* %"b"
  %".347" = sub i32 %"a.16", %"b.12"
  ;  Source: d
  %"d.16" = load i32, i32* %"d"
  %".349" = icmp slt i32 %".347", %"d.16"
  %".350" = zext i1 %".349" to i32
  ;  Source: e
  %"e.16" = load i32, i32* %"e"
  ;  Source: g
  %"g.12" = load i32, i32* %"g"
  ;  Source: (e>g)
  %".354" = icmp sgt i32 %"e.16", %"g.12"
  %".355" = zext i1 %".354" to i32
  ;  Source: (!(e>g))
  %".357" = icmp eq i32 %".355", 0
  %".358" = zext i1 %".357" to i32
  ;  Source: (a-b<d&&(!(e>g)))
  %".360" = icmp ne i32 %".350", 0
  %".361" = icmp ne i32 %".358", 0
  %".362" = and i1 %".360", %".361"
  %".363" = zext i1 %".362" to i32
  ;  Source: h=(a-b<d&&(!(e>g)));
  store i32 %".363", i32* %"h"
  %".366" = bitcast [3 x i8]* @"str.11" to i8*
  ;  Source: h
  %"h.8" = load i32, i32* %"h"
  ;  Source: printf("%d",h);
  %".369" = call i32 (i8*, ...) @"printf"(i8* %".366", i32 %"h.8")
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