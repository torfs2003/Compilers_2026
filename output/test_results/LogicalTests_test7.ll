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
  ;  Source: b
  %"b.2" = load i32, i32* %"b"
  ;  Source: c
  %"c.2" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".28" = icmp ne i32 %"b.2", 0
  %".29" = icmp ne i32 %"c.2", 0
  %".30" = or i1 %".28", %".29"
  %".31" = zext i1 %".30" to i32
  ;  Source: (a&&(b||c))
  %".33" = icmp ne i32 %"a.2", 0
  %".34" = icmp ne i32 %".31", 0
  %".35" = and i1 %".33", %".34"
  %".36" = zext i1 %".35" to i32
  ;  Source: d
  %"d.2" = load i32, i32* %"d"
  ;  Source: c
  %"c.3" = load i32, i32* %"c"
  ;  Source: (d&&c)
  %".40" = icmp ne i32 %"d.2", 0
  %".41" = icmp ne i32 %"c.3", 0
  %".42" = and i1 %".40", %".41"
  %".43" = zext i1 %".42" to i32
  ;  Source: e
  %"e.2" = load i32, i32* %"e"
  %".45" = icmp ne i32 %".43", 0
  %".46" = icmp ne i32 %"e.2", 0
  %".47" = and i1 %".45", %".46"
  %".48" = zext i1 %".47" to i32
  ;  Source: (a&&(b||c))||(d&&c)&&e
  %".50" = icmp ne i32 %".36", 0
  %".51" = icmp ne i32 %".48", 0
  %".52" = or i1 %".50", %".51"
  %".53" = zext i1 %".52" to i32
  ;  Source: f=(a&&(b||c))||(d&&c)&&e;
  store i32 %".53", i32* %"f"
  %".56" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f
  %"f.2" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".59" = call i32 (i8*, ...) @"printf"(i8* %".56", i32 %"f.2")
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  ;  Source: f
  %"f.3" = load i32, i32* %"f"
  ;  Source: a
  %"a.4" = load i32, i32* %"a"
  ;  Source: b
  %"b.3" = load i32, i32* %"b"
  ;  Source: c
  %"c.4" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".68" = icmp ne i32 %"b.3", 0
  %".69" = icmp ne i32 %"c.4", 0
  %".70" = or i1 %".68", %".69"
  %".71" = zext i1 %".70" to i32
  ;  Source: (a&&(b||c))
  %".73" = icmp ne i32 %"a.4", 0
  %".74" = icmp ne i32 %".71", 0
  %".75" = and i1 %".73", %".74"
  %".76" = zext i1 %".75" to i32
  ;  Source: d
  %"d.3" = load i32, i32* %"d"
  ;  Source: c
  %"c.5" = load i32, i32* %"c"
  ;  Source: (d&&c)
  %".80" = icmp ne i32 %"d.3", 0
  %".81" = icmp ne i32 %"c.5", 0
  %".82" = and i1 %".80", %".81"
  %".83" = zext i1 %".82" to i32
  ;  Source: e
  %"e.3" = load i32, i32* %"e"
  %".85" = icmp ne i32 %".83", 0
  %".86" = icmp ne i32 %"e.3", 0
  %".87" = and i1 %".85", %".86"
  %".88" = zext i1 %".87" to i32
  ;  Source: (a&&(b||c))||(d&&c)&&e
  %".90" = icmp ne i32 %".76", 0
  %".91" = icmp ne i32 %".88", 0
  %".92" = or i1 %".90", %".91"
  %".93" = zext i1 %".92" to i32
  ;  Source: f=(a&&(b||c))||(d&&c)&&e;
  store i32 %".93", i32* %"f"
  %".96" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: f
  %"f.4" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".99" = call i32 (i8*, ...) @"printf"(i8* %".96", i32 %"f.4")
  ;  Source: b
  %"b.4" = load i32, i32* %"b"
  ;  Source: b=1;
  store i32 1, i32* %"b"
  ;  Source: f
  %"f.5" = load i32, i32* %"f"
  ;  Source: a
  %"a.5" = load i32, i32* %"a"
  ;  Source: b
  %"b.5" = load i32, i32* %"b"
  ;  Source: c
  %"c.6" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".108" = icmp ne i32 %"b.5", 0
  %".109" = icmp ne i32 %"c.6", 0
  %".110" = or i1 %".108", %".109"
  %".111" = zext i1 %".110" to i32
  ;  Source: (a&&(b||c))
  %".113" = icmp ne i32 %"a.5", 0
  %".114" = icmp ne i32 %".111", 0
  %".115" = and i1 %".113", %".114"
  %".116" = zext i1 %".115" to i32
  ;  Source: d
  %"d.4" = load i32, i32* %"d"
  ;  Source: c
  %"c.7" = load i32, i32* %"c"
  ;  Source: (d&&c)
  %".120" = icmp ne i32 %"d.4", 0
  %".121" = icmp ne i32 %"c.7", 0
  %".122" = and i1 %".120", %".121"
  %".123" = zext i1 %".122" to i32
  ;  Source: e
  %"e.4" = load i32, i32* %"e"
  %".125" = icmp ne i32 %".123", 0
  %".126" = icmp ne i32 %"e.4", 0
  %".127" = and i1 %".125", %".126"
  %".128" = zext i1 %".127" to i32
  ;  Source: (a&&(b||c))||(d&&c)&&e
  %".130" = icmp ne i32 %".116", 0
  %".131" = icmp ne i32 %".128", 0
  %".132" = or i1 %".130", %".131"
  %".133" = zext i1 %".132" to i32
  ;  Source: f=(a&&(b||c))||(d&&c)&&e;
  store i32 %".133", i32* %"f"
  %".136" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: f
  %"f.6" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".139" = call i32 (i8*, ...) @"printf"(i8* %".136", i32 %"f.6")
  ;  Source: c
  %"c.8" = load i32, i32* %"c"
  ;  Source: c=1;
  store i32 1, i32* %"c"
  ;  Source: f
  %"f.7" = load i32, i32* %"f"
  ;  Source: a
  %"a.6" = load i32, i32* %"a"
  ;  Source: b
  %"b.6" = load i32, i32* %"b"
  ;  Source: c
  %"c.9" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".148" = icmp ne i32 %"b.6", 0
  %".149" = icmp ne i32 %"c.9", 0
  %".150" = or i1 %".148", %".149"
  %".151" = zext i1 %".150" to i32
  ;  Source: (a&&(b||c))
  %".153" = icmp ne i32 %"a.6", 0
  %".154" = icmp ne i32 %".151", 0
  %".155" = and i1 %".153", %".154"
  %".156" = zext i1 %".155" to i32
  ;  Source: d
  %"d.5" = load i32, i32* %"d"
  ;  Source: c
  %"c.10" = load i32, i32* %"c"
  ;  Source: (d&&c)
  %".160" = icmp ne i32 %"d.5", 0
  %".161" = icmp ne i32 %"c.10", 0
  %".162" = and i1 %".160", %".161"
  %".163" = zext i1 %".162" to i32
  ;  Source: e
  %"e.5" = load i32, i32* %"e"
  %".165" = icmp ne i32 %".163", 0
  %".166" = icmp ne i32 %"e.5", 0
  %".167" = and i1 %".165", %".166"
  %".168" = zext i1 %".167" to i32
  ;  Source: (a&&(b||c))||(d&&c)&&e
  %".170" = icmp ne i32 %".156", 0
  %".171" = icmp ne i32 %".168", 0
  %".172" = or i1 %".170", %".171"
  %".173" = zext i1 %".172" to i32
  ;  Source: f=(a&&(b||c))||(d&&c)&&e;
  store i32 %".173", i32* %"f"
  %".176" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: f
  %"f.8" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".179" = call i32 (i8*, ...) @"printf"(i8* %".176", i32 %"f.8")
  ;  Source: d
  %"d.6" = load i32, i32* %"d"
  ;  Source: d=1;
  store i32 1, i32* %"d"
  ;  Source: f
  %"f.9" = load i32, i32* %"f"
  ;  Source: a
  %"a.7" = load i32, i32* %"a"
  ;  Source: b
  %"b.7" = load i32, i32* %"b"
  ;  Source: c
  %"c.11" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".188" = icmp ne i32 %"b.7", 0
  %".189" = icmp ne i32 %"c.11", 0
  %".190" = or i1 %".188", %".189"
  %".191" = zext i1 %".190" to i32
  ;  Source: (a&&(b||c))
  %".193" = icmp ne i32 %"a.7", 0
  %".194" = icmp ne i32 %".191", 0
  %".195" = and i1 %".193", %".194"
  %".196" = zext i1 %".195" to i32
  ;  Source: d
  %"d.7" = load i32, i32* %"d"
  ;  Source: c
  %"c.12" = load i32, i32* %"c"
  ;  Source: (d&&c)
  %".200" = icmp ne i32 %"d.7", 0
  %".201" = icmp ne i32 %"c.12", 0
  %".202" = and i1 %".200", %".201"
  %".203" = zext i1 %".202" to i32
  ;  Source: e
  %"e.6" = load i32, i32* %"e"
  %".205" = icmp ne i32 %".203", 0
  %".206" = icmp ne i32 %"e.6", 0
  %".207" = and i1 %".205", %".206"
  %".208" = zext i1 %".207" to i32
  ;  Source: (a&&(b||c))||(d&&c)&&e
  %".210" = icmp ne i32 %".196", 0
  %".211" = icmp ne i32 %".208", 0
  %".212" = or i1 %".210", %".211"
  %".213" = zext i1 %".212" to i32
  ;  Source: f=(a&&(b||c))||(d&&c)&&e;
  store i32 %".213", i32* %"f"
  %".216" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: f
  %"f.10" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".219" = call i32 (i8*, ...) @"printf"(i8* %".216", i32 %"f.10")
  ;  Source: e
  %"e.7" = load i32, i32* %"e"
  ;  Source: e=1;
  store i32 1, i32* %"e"
  ;  Source: f
  %"f.11" = load i32, i32* %"f"
  ;  Source: a
  %"a.8" = load i32, i32* %"a"
  ;  Source: b
  %"b.8" = load i32, i32* %"b"
  ;  Source: c
  %"c.13" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".228" = icmp ne i32 %"b.8", 0
  %".229" = icmp ne i32 %"c.13", 0
  %".230" = or i1 %".228", %".229"
  %".231" = zext i1 %".230" to i32
  ;  Source: (a&&(b||c))
  %".233" = icmp ne i32 %"a.8", 0
  %".234" = icmp ne i32 %".231", 0
  %".235" = and i1 %".233", %".234"
  %".236" = zext i1 %".235" to i32
  ;  Source: d
  %"d.8" = load i32, i32* %"d"
  ;  Source: c
  %"c.14" = load i32, i32* %"c"
  ;  Source: (d&&c)
  %".240" = icmp ne i32 %"d.8", 0
  %".241" = icmp ne i32 %"c.14", 0
  %".242" = and i1 %".240", %".241"
  %".243" = zext i1 %".242" to i32
  ;  Source: e
  %"e.8" = load i32, i32* %"e"
  %".245" = icmp ne i32 %".243", 0
  %".246" = icmp ne i32 %"e.8", 0
  %".247" = and i1 %".245", %".246"
  %".248" = zext i1 %".247" to i32
  ;  Source: (a&&(b||c))||(d&&c)&&e
  %".250" = icmp ne i32 %".236", 0
  %".251" = icmp ne i32 %".248", 0
  %".252" = or i1 %".250", %".251"
  %".253" = zext i1 %".252" to i32
  ;  Source: f=(a&&(b||c))||(d&&c)&&e;
  store i32 %".253", i32* %"f"
  %".256" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: f
  %"f.12" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".259" = call i32 (i8*, ...) @"printf"(i8* %".256", i32 %"f.12")
  ;  Source: b
  %"b.9" = load i32, i32* %"b"
  ;  Source: b=0;
  store i32 0, i32* %"b"
  ;  Source: f
  %"f.13" = load i32, i32* %"f"
  ;  Source: a
  %"a.9" = load i32, i32* %"a"
  ;  Source: b
  %"b.10" = load i32, i32* %"b"
  ;  Source: c
  %"c.15" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".268" = icmp ne i32 %"b.10", 0
  %".269" = icmp ne i32 %"c.15", 0
  %".270" = or i1 %".268", %".269"
  %".271" = zext i1 %".270" to i32
  ;  Source: (a&&(b||c))
  %".273" = icmp ne i32 %"a.9", 0
  %".274" = icmp ne i32 %".271", 0
  %".275" = and i1 %".273", %".274"
  %".276" = zext i1 %".275" to i32
  ;  Source: d
  %"d.9" = load i32, i32* %"d"
  ;  Source: c
  %"c.16" = load i32, i32* %"c"
  ;  Source: (d&&c)
  %".280" = icmp ne i32 %"d.9", 0
  %".281" = icmp ne i32 %"c.16", 0
  %".282" = and i1 %".280", %".281"
  %".283" = zext i1 %".282" to i32
  ;  Source: e
  %"e.9" = load i32, i32* %"e"
  %".285" = icmp ne i32 %".283", 0
  %".286" = icmp ne i32 %"e.9", 0
  %".287" = and i1 %".285", %".286"
  %".288" = zext i1 %".287" to i32
  ;  Source: (a&&(b||c))||(d&&c)&&e
  %".290" = icmp ne i32 %".276", 0
  %".291" = icmp ne i32 %".288", 0
  %".292" = or i1 %".290", %".291"
  %".293" = zext i1 %".292" to i32
  ;  Source: f=(a&&(b||c))||(d&&c)&&e;
  store i32 %".293", i32* %"f"
  %".296" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: f
  %"f.14" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".299" = call i32 (i8*, ...) @"printf"(i8* %".296", i32 %"f.14")
  ;  Source: c
  %"c.17" = load i32, i32* %"c"
  ;  Source: c=0;
  store i32 0, i32* %"c"
  ;  Source: f
  %"f.15" = load i32, i32* %"f"
  ;  Source: a
  %"a.10" = load i32, i32* %"a"
  ;  Source: b
  %"b.11" = load i32, i32* %"b"
  ;  Source: c
  %"c.18" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".308" = icmp ne i32 %"b.11", 0
  %".309" = icmp ne i32 %"c.18", 0
  %".310" = or i1 %".308", %".309"
  %".311" = zext i1 %".310" to i32
  ;  Source: (a&&(b||c))
  %".313" = icmp ne i32 %"a.10", 0
  %".314" = icmp ne i32 %".311", 0
  %".315" = and i1 %".313", %".314"
  %".316" = zext i1 %".315" to i32
  ;  Source: d
  %"d.10" = load i32, i32* %"d"
  ;  Source: c
  %"c.19" = load i32, i32* %"c"
  ;  Source: (d&&c)
  %".320" = icmp ne i32 %"d.10", 0
  %".321" = icmp ne i32 %"c.19", 0
  %".322" = and i1 %".320", %".321"
  %".323" = zext i1 %".322" to i32
  ;  Source: e
  %"e.10" = load i32, i32* %"e"
  %".325" = icmp ne i32 %".323", 0
  %".326" = icmp ne i32 %"e.10", 0
  %".327" = and i1 %".325", %".326"
  %".328" = zext i1 %".327" to i32
  ;  Source: (a&&(b||c))||(d&&c)&&e
  %".330" = icmp ne i32 %".316", 0
  %".331" = icmp ne i32 %".328", 0
  %".332" = or i1 %".330", %".331"
  %".333" = zext i1 %".332" to i32
  ;  Source: f=(a&&(b||c))||(d&&c)&&e;
  store i32 %".333", i32* %"f"
  %".336" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: f
  %"f.16" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".339" = call i32 (i8*, ...) @"printf"(i8* %".336", i32 %"f.16")
  ;  Source: d
  %"d.11" = load i32, i32* %"d"
  ;  Source: d=0;
  store i32 0, i32* %"d"
  ;  Source: f
  %"f.17" = load i32, i32* %"f"
  ;  Source: a
  %"a.11" = load i32, i32* %"a"
  ;  Source: b
  %"b.12" = load i32, i32* %"b"
  ;  Source: c
  %"c.20" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".348" = icmp ne i32 %"b.12", 0
  %".349" = icmp ne i32 %"c.20", 0
  %".350" = or i1 %".348", %".349"
  %".351" = zext i1 %".350" to i32
  ;  Source: (a&&(b||c))
  %".353" = icmp ne i32 %"a.11", 0
  %".354" = icmp ne i32 %".351", 0
  %".355" = and i1 %".353", %".354"
  %".356" = zext i1 %".355" to i32
  ;  Source: d
  %"d.12" = load i32, i32* %"d"
  ;  Source: c
  %"c.21" = load i32, i32* %"c"
  ;  Source: (d&&c)
  %".360" = icmp ne i32 %"d.12", 0
  %".361" = icmp ne i32 %"c.21", 0
  %".362" = and i1 %".360", %".361"
  %".363" = zext i1 %".362" to i32
  ;  Source: e
  %"e.11" = load i32, i32* %"e"
  %".365" = icmp ne i32 %".363", 0
  %".366" = icmp ne i32 %"e.11", 0
  %".367" = and i1 %".365", %".366"
  %".368" = zext i1 %".367" to i32
  ;  Source: (a&&(b||c))||(d&&c)&&e
  %".370" = icmp ne i32 %".356", 0
  %".371" = icmp ne i32 %".368", 0
  %".372" = or i1 %".370", %".371"
  %".373" = zext i1 %".372" to i32
  ;  Source: f=(a&&(b||c))||(d&&c)&&e;
  store i32 %".373", i32* %"f"
  %".376" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: f
  %"f.18" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".379" = call i32 (i8*, ...) @"printf"(i8* %".376", i32 %"f.18")
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