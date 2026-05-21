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
  ;  Source: a
  %"a_load" = load i32, i32* %"a"
  ;  Source: a=0;
  store i32 0, i32* %"a"
  ;  Source: b
  %"b_load" = load i32, i32* %"b"
  ;  Source: b=0;
  store i32 0, i32* %"b"
  ;  Source: c
  %"c_load" = load i32, i32* %"c"
  ;  Source: c=0;
  store i32 0, i32* %"c"
  ;  Source: d
  %"d_load" = load i32, i32* %"d"
  ;  Source: d=0;
  store i32 0, i32* %"d"
  ;  Source: e
  %"e_load" = load i32, i32* %"e"
  ;  Source: e=0;
  store i32 0, i32* %"e"
  ;  Source: f
  %"f_load" = load i32, i32* %"f"
  ;  Source: a
  %"a_load.1" = load i32, i32* %"a"
  ;  Source: e
  %"e_load.1" = load i32, i32* %"e"
  ;  Source: d
  %"d_load.1" = load i32, i32* %"d"
  ;  Source: (d&&5<6)
  %".30" = icmp ne i32 %"d_load.1", 0
  %".31" = icmp ne i32 1, 0
  %".32" = and i1 %".30", %".31"
  %".33" = zext i1 %".32" to i32
  %".34" = icmp ne i32 %"e_load.1", 0
  %".35" = icmp ne i32 %".33", 0
  %".36" = and i1 %".34", %".35"
  %".37" = zext i1 %".36" to i32
  ;  Source: (a||e&&(d&&5<6))
  %".39" = icmp ne i32 %"a_load.1", 0
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
  %"f_load.1" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".51" = call i32 (i8*, ...) @"printf"(i8* %".48", i32 %"f_load.1")
  ;  Source: g
  %"g_load" = load i32, i32* %"g"
  ;  Source: a
  %"a_load.2" = load i32, i32* %"a"
  ;  Source: d
  %"d_load.2" = load i32, i32* %"d"
  %".55" = icmp slt i32 %"a_load.2", %"d_load.2"
  %".56" = zext i1 %".55" to i32
  ;  Source: e
  %"e_load.2" = load i32, i32* %"e"
  ;  Source: b
  %"b_load.1" = load i32, i32* %"b"
  %".59" = icmp sge i32 %"e_load.2", %"b_load.1"
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
  %"g_load.1" = load i32, i32* %"g"
  ;  Source: printf("%d",g);
  %".71" = call i32 (i8*, ...) @"printf"(i8* %".68", i32 %"g_load.1")
  ;  Source: h
  %"h_load" = load i32, i32* %"h"
  ;  Source: a
  %"a_load.3" = load i32, i32* %"a"
  ;  Source: b
  %"b_load.2" = load i32, i32* %"b"
  %".75" = sub i32 %"a_load.3", %"b_load.2"
  ;  Source: d
  %"d_load.3" = load i32, i32* %"d"
  %".77" = icmp slt i32 %".75", %"d_load.3"
  %".78" = zext i1 %".77" to i32
  ;  Source: e
  %"e_load.3" = load i32, i32* %"e"
  ;  Source: g
  %"g_load.2" = load i32, i32* %"g"
  ;  Source: (e>g)
  %".82" = icmp sgt i32 %"e_load.3", %"g_load.2"
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
  %"h_load.1" = load i32, i32* %"h"
  ;  Source: printf("%d",h);
  %".97" = call i32 (i8*, ...) @"printf"(i8* %".94", i32 %"h_load.1")
  ;  Source: a
  %"a_load.4" = load i32, i32* %"a"
  ;  Source: a=0;
  store i32 0, i32* %"a"
  ;  Source: b
  %"b_load.3" = load i32, i32* %"b"
  ;  Source: b=1;
  store i32 1, i32* %"b"
  ;  Source: c
  %"c_load.1" = load i32, i32* %"c"
  ;  Source: c=0;
  store i32 0, i32* %"c"
  ;  Source: d
  %"d_load.4" = load i32, i32* %"d"
  ;  Source: d=1;
  store i32 1, i32* %"d"
  ;  Source: e
  %"e_load.4" = load i32, i32* %"e"
  ;  Source: e=0;
  store i32 0, i32* %"e"
  ;  Source: f
  %"f_load.2" = load i32, i32* %"f"
  ;  Source: a
  %"a_load.5" = load i32, i32* %"a"
  ;  Source: e
  %"e_load.5" = load i32, i32* %"e"
  ;  Source: d
  %"d_load.5" = load i32, i32* %"d"
  ;  Source: (d&&5<6)
  %".118" = icmp ne i32 %"d_load.5", 0
  %".119" = icmp ne i32 1, 0
  %".120" = and i1 %".118", %".119"
  %".121" = zext i1 %".120" to i32
  %".122" = icmp ne i32 %"e_load.5", 0
  %".123" = icmp ne i32 %".121", 0
  %".124" = and i1 %".122", %".123"
  %".125" = zext i1 %".124" to i32
  ;  Source: (a||e&&(d&&5<6))
  %".127" = icmp ne i32 %"a_load.5", 0
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
  %"f_load.3" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".139" = call i32 (i8*, ...) @"printf"(i8* %".136", i32 %"f_load.3")
  ;  Source: g
  %"g_load.3" = load i32, i32* %"g"
  ;  Source: a
  %"a_load.6" = load i32, i32* %"a"
  ;  Source: d
  %"d_load.6" = load i32, i32* %"d"
  %".143" = icmp slt i32 %"a_load.6", %"d_load.6"
  %".144" = zext i1 %".143" to i32
  ;  Source: e
  %"e_load.6" = load i32, i32* %"e"
  ;  Source: b
  %"b_load.4" = load i32, i32* %"b"
  %".147" = icmp sge i32 %"e_load.6", %"b_load.4"
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
  %"g_load.4" = load i32, i32* %"g"
  ;  Source: printf("%d",g);
  %".159" = call i32 (i8*, ...) @"printf"(i8* %".156", i32 %"g_load.4")
  ;  Source: h
  %"h_load.2" = load i32, i32* %"h"
  ;  Source: a
  %"a_load.7" = load i32, i32* %"a"
  ;  Source: b
  %"b_load.5" = load i32, i32* %"b"
  %".163" = sub i32 %"a_load.7", %"b_load.5"
  ;  Source: d
  %"d_load.7" = load i32, i32* %"d"
  %".165" = icmp slt i32 %".163", %"d_load.7"
  %".166" = zext i1 %".165" to i32
  ;  Source: e
  %"e_load.7" = load i32, i32* %"e"
  ;  Source: g
  %"g_load.5" = load i32, i32* %"g"
  ;  Source: (e>g)
  %".170" = icmp sgt i32 %"e_load.7", %"g_load.5"
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
  %"h_load.3" = load i32, i32* %"h"
  ;  Source: printf("%d",h);
  %".185" = call i32 (i8*, ...) @"printf"(i8* %".182", i32 %"h_load.3")
  ;  Source: a
  %"a_load.8" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  ;  Source: b
  %"b_load.6" = load i32, i32* %"b"
  ;  Source: b=1;
  store i32 1, i32* %"b"
  ;  Source: c
  %"c_load.2" = load i32, i32* %"c"
  ;  Source: c=1;
  store i32 1, i32* %"c"
  ;  Source: d
  %"d_load.8" = load i32, i32* %"d"
  ;  Source: d=1;
  store i32 1, i32* %"d"
  ;  Source: e
  %"e_load.8" = load i32, i32* %"e"
  ;  Source: e=0;
  store i32 0, i32* %"e"
  ;  Source: f
  %"f_load.4" = load i32, i32* %"f"
  ;  Source: a
  %"a_load.9" = load i32, i32* %"a"
  ;  Source: e
  %"e_load.9" = load i32, i32* %"e"
  ;  Source: d
  %"d_load.9" = load i32, i32* %"d"
  ;  Source: (d&&5<6)
  %".206" = icmp ne i32 %"d_load.9", 0
  %".207" = icmp ne i32 1, 0
  %".208" = and i1 %".206", %".207"
  %".209" = zext i1 %".208" to i32
  %".210" = icmp ne i32 %"e_load.9", 0
  %".211" = icmp ne i32 %".209", 0
  %".212" = and i1 %".210", %".211"
  %".213" = zext i1 %".212" to i32
  ;  Source: (a||e&&(d&&5<6))
  %".215" = icmp ne i32 %"a_load.9", 0
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
  %"f_load.5" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".227" = call i32 (i8*, ...) @"printf"(i8* %".224", i32 %"f_load.5")
  ;  Source: g
  %"g_load.6" = load i32, i32* %"g"
  ;  Source: a
  %"a_load.10" = load i32, i32* %"a"
  ;  Source: d
  %"d_load.10" = load i32, i32* %"d"
  %".231" = icmp slt i32 %"a_load.10", %"d_load.10"
  %".232" = zext i1 %".231" to i32
  ;  Source: e
  %"e_load.10" = load i32, i32* %"e"
  ;  Source: b
  %"b_load.7" = load i32, i32* %"b"
  %".235" = icmp sge i32 %"e_load.10", %"b_load.7"
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
  %"g_load.7" = load i32, i32* %"g"
  ;  Source: printf("%d",g);
  %".247" = call i32 (i8*, ...) @"printf"(i8* %".244", i32 %"g_load.7")
  ;  Source: h
  %"h_load.4" = load i32, i32* %"h"
  ;  Source: a
  %"a_load.11" = load i32, i32* %"a"
  ;  Source: b
  %"b_load.8" = load i32, i32* %"b"
  %".251" = sub i32 %"a_load.11", %"b_load.8"
  ;  Source: d
  %"d_load.11" = load i32, i32* %"d"
  %".253" = icmp slt i32 %".251", %"d_load.11"
  %".254" = zext i1 %".253" to i32
  ;  Source: e
  %"e_load.11" = load i32, i32* %"e"
  ;  Source: g
  %"g_load.8" = load i32, i32* %"g"
  ;  Source: (e>g)
  %".258" = icmp sgt i32 %"e_load.11", %"g_load.8"
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
  %"h_load.5" = load i32, i32* %"h"
  ;  Source: printf("%d",h);
  %".273" = call i32 (i8*, ...) @"printf"(i8* %".270", i32 %"h_load.5")
  ;  Source: a
  %"a_load.12" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  ;  Source: b
  %"b_load.9" = load i32, i32* %"b"
  ;  Source: b=0;
  store i32 0, i32* %"b"
  ;  Source: c
  %"c_load.3" = load i32, i32* %"c"
  ;  Source: c=0;
  store i32 0, i32* %"c"
  ;  Source: d
  %"d_load.12" = load i32, i32* %"d"
  ;  Source: d=1;
  store i32 1, i32* %"d"
  ;  Source: e
  %"e_load.12" = load i32, i32* %"e"
  ;  Source: e=0;
  store i32 0, i32* %"e"
  ;  Source: f
  %"f_load.6" = load i32, i32* %"f"
  ;  Source: a
  %"a_load.13" = load i32, i32* %"a"
  ;  Source: e
  %"e_load.13" = load i32, i32* %"e"
  ;  Source: d
  %"d_load.13" = load i32, i32* %"d"
  ;  Source: (d&&5<6)
  %".294" = icmp ne i32 %"d_load.13", 0
  %".295" = icmp ne i32 1, 0
  %".296" = and i1 %".294", %".295"
  %".297" = zext i1 %".296" to i32
  %".298" = icmp ne i32 %"e_load.13", 0
  %".299" = icmp ne i32 %".297", 0
  %".300" = and i1 %".298", %".299"
  %".301" = zext i1 %".300" to i32
  ;  Source: (a||e&&(d&&5<6))
  %".303" = icmp ne i32 %"a_load.13", 0
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
  %"f_load.7" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".315" = call i32 (i8*, ...) @"printf"(i8* %".312", i32 %"f_load.7")
  ;  Source: g
  %"g_load.9" = load i32, i32* %"g"
  ;  Source: a
  %"a_load.14" = load i32, i32* %"a"
  ;  Source: d
  %"d_load.14" = load i32, i32* %"d"
  %".319" = icmp slt i32 %"a_load.14", %"d_load.14"
  %".320" = zext i1 %".319" to i32
  ;  Source: e
  %"e_load.14" = load i32, i32* %"e"
  ;  Source: b
  %"b_load.10" = load i32, i32* %"b"
  %".323" = icmp sge i32 %"e_load.14", %"b_load.10"
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
  %"g_load.10" = load i32, i32* %"g"
  ;  Source: printf("%d",g);
  %".335" = call i32 (i8*, ...) @"printf"(i8* %".332", i32 %"g_load.10")
  ;  Source: h
  %"h_load.6" = load i32, i32* %"h"
  ;  Source: a
  %"a_load.15" = load i32, i32* %"a"
  ;  Source: b
  %"b_load.11" = load i32, i32* %"b"
  %".339" = sub i32 %"a_load.15", %"b_load.11"
  ;  Source: d
  %"d_load.15" = load i32, i32* %"d"
  %".341" = icmp slt i32 %".339", %"d_load.15"
  %".342" = zext i1 %".341" to i32
  ;  Source: e
  %"e_load.15" = load i32, i32* %"e"
  ;  Source: g
  %"g_load.11" = load i32, i32* %"g"
  ;  Source: (e>g)
  %".346" = icmp sgt i32 %"e_load.15", %"g_load.11"
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
  %"h_load.7" = load i32, i32* %"h"
  ;  Source: printf("%d",h);
  %".361" = call i32 (i8*, ...) @"printf"(i8* %".358", i32 %"h_load.7")
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