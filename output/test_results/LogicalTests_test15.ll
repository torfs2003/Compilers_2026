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
  %".32" = icmp eq i32 %".31", 0
  %".33" = zext i1 %".32" to i32
  %".34" = icmp ne i32 %"a.2", 0
  %".35" = icmp ne i32 %".33", 0
  %".36" = and i1 %".34", %".35"
  %".37" = zext i1 %".36" to i32
  ;  Source: b
  %"b.3" = load i32, i32* %"b"
  ;  Source: d
  %"d.2" = load i32, i32* %"d"
  %".40" = icmp eq i32 %"d.2", 0
  %".41" = zext i1 %".40" to i32
  %".42" = icmp ne i32 %"b.3", 0
  %".43" = icmp ne i32 %".41", 0
  %".44" = and i1 %".42", %".43"
  %".45" = zext i1 %".44" to i32
  ;  Source: e
  %"e.2" = load i32, i32* %"e"
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  %".48" = icmp eq i32 %"a.3", 0
  %".49" = zext i1 %".48" to i32
  ;  Source: (e&&!a)
  %".51" = icmp ne i32 %"e.2", 0
  %".52" = icmp ne i32 %".49", 0
  %".53" = and i1 %".51", %".52"
  %".54" = zext i1 %".53" to i32
  ;  Source: (b&&!d||(e&&!a))
  %".56" = icmp ne i32 %".45", 0
  %".57" = icmp ne i32 %".54", 0
  %".58" = or i1 %".56", %".57"
  %".59" = zext i1 %".58" to i32
  %".60" = icmp eq i32 %".59", 0
  %".61" = zext i1 %".60" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d||(e&&!a)))
  %".63" = icmp ne i32 %".37", 0
  %".64" = icmp ne i32 %".61", 0
  %".65" = or i1 %".63", %".64"
  %".66" = zext i1 %".65" to i32
  ;  Source: f=(a&&!(b||c)||!(b&&!d||(e&&!a)));
  store i32 %".66", i32* %"f"
  %".69" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f
  %"f.2" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".72" = call i32 (i8*, ...) @"printf"(i8* %".69", i32 %"f.2")
  ;  Source: a
  %"a.4" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  ;  Source: f
  %"f.3" = load i32, i32* %"f"
  ;  Source: a
  %"a.5" = load i32, i32* %"a"
  ;  Source: b
  %"b.4" = load i32, i32* %"b"
  ;  Source: c
  %"c.3" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".81" = icmp ne i32 %"b.4", 0
  %".82" = icmp ne i32 %"c.3", 0
  %".83" = or i1 %".81", %".82"
  %".84" = zext i1 %".83" to i32
  %".85" = icmp eq i32 %".84", 0
  %".86" = zext i1 %".85" to i32
  ;  Source: (a&&!(b||c))
  %".88" = icmp ne i32 %"a.5", 0
  %".89" = icmp ne i32 %".86", 0
  %".90" = and i1 %".88", %".89"
  %".91" = zext i1 %".90" to i32
  ;  Source: f=(a&&!(b||c));
  store i32 %".91", i32* %"f"
  %".94" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: f
  %"f.4" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".97" = call i32 (i8*, ...) @"printf"(i8* %".94", i32 %"f.4")
  ;  Source: f
  %"f.5" = load i32, i32* %"f"
  ;  Source: a
  %"a.6" = load i32, i32* %"a"
  ;  Source: b
  %"b.5" = load i32, i32* %"b"
  ;  Source: c
  %"c.4" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".103" = icmp ne i32 %"b.5", 0
  %".104" = icmp ne i32 %"c.4", 0
  %".105" = or i1 %".103", %".104"
  %".106" = zext i1 %".105" to i32
  %".107" = icmp eq i32 %".106", 0
  %".108" = zext i1 %".107" to i32
  %".109" = icmp ne i32 %"a.6", 0
  %".110" = icmp ne i32 %".108", 0
  %".111" = and i1 %".109", %".110"
  %".112" = zext i1 %".111" to i32
  ;  Source: b
  %"b.6" = load i32, i32* %"b"
  ;  Source: d
  %"d.3" = load i32, i32* %"d"
  %".115" = icmp eq i32 %"d.3", 0
  %".116" = zext i1 %".115" to i32
  ;  Source: (b&&!d)
  %".118" = icmp ne i32 %"b.6", 0
  %".119" = icmp ne i32 %".116", 0
  %".120" = and i1 %".118", %".119"
  %".121" = zext i1 %".120" to i32
  %".122" = icmp eq i32 %".121", 0
  %".123" = zext i1 %".122" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".125" = icmp ne i32 %".112", 0
  %".126" = icmp ne i32 %".123", 0
  %".127" = or i1 %".125", %".126"
  %".128" = zext i1 %".127" to i32
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".128", i32* %"f"
  %".131" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: f
  %"f.6" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".134" = call i32 (i8*, ...) @"printf"(i8* %".131", i32 %"f.6")
  ;  Source: a
  %"a.7" = load i32, i32* %"a"
  ;  Source: a=0;
  store i32 0, i32* %"a"
  ;  Source: b
  %"b.7" = load i32, i32* %"b"
  ;  Source: b=1;
  store i32 1, i32* %"b"
  ;  Source: d
  %"d.4" = load i32, i32* %"d"
  ;  Source: d=1;
  store i32 1, i32* %"d"
  ;  Source: f
  %"f.7" = load i32, i32* %"f"
  ;  Source: a
  %"a.8" = load i32, i32* %"a"
  ;  Source: b
  %"b.8" = load i32, i32* %"b"
  ;  Source: c
  %"c.5" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".149" = icmp ne i32 %"b.8", 0
  %".150" = icmp ne i32 %"c.5", 0
  %".151" = or i1 %".149", %".150"
  %".152" = zext i1 %".151" to i32
  %".153" = icmp eq i32 %".152", 0
  %".154" = zext i1 %".153" to i32
  %".155" = icmp ne i32 %"a.8", 0
  %".156" = icmp ne i32 %".154", 0
  %".157" = and i1 %".155", %".156"
  %".158" = zext i1 %".157" to i32
  ;  Source: b
  %"b.9" = load i32, i32* %"b"
  ;  Source: d
  %"d.5" = load i32, i32* %"d"
  %".161" = icmp eq i32 %"d.5", 0
  %".162" = zext i1 %".161" to i32
  ;  Source: (b&&!d)
  %".164" = icmp ne i32 %"b.9", 0
  %".165" = icmp ne i32 %".162", 0
  %".166" = and i1 %".164", %".165"
  %".167" = zext i1 %".166" to i32
  %".168" = icmp eq i32 %".167", 0
  %".169" = zext i1 %".168" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".171" = icmp ne i32 %".158", 0
  %".172" = icmp ne i32 %".169", 0
  %".173" = or i1 %".171", %".172"
  %".174" = zext i1 %".173" to i32
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".174", i32* %"f"
  %".177" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: f
  %"f.8" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".180" = call i32 (i8*, ...) @"printf"(i8* %".177", i32 %"f.8")
  ;  Source: a
  %"a.9" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  ;  Source: b
  %"b.10" = load i32, i32* %"b"
  ;  Source: b=1;
  store i32 1, i32* %"b"
  ;  Source: f
  %"f.9" = load i32, i32* %"f"
  ;  Source: a
  %"a.10" = load i32, i32* %"a"
  ;  Source: b
  %"b.11" = load i32, i32* %"b"
  ;  Source: c
  %"c.6" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".192" = icmp ne i32 %"b.11", 0
  %".193" = icmp ne i32 %"c.6", 0
  %".194" = or i1 %".192", %".193"
  %".195" = zext i1 %".194" to i32
  %".196" = icmp eq i32 %".195", 0
  %".197" = zext i1 %".196" to i32
  %".198" = icmp ne i32 %"a.10", 0
  %".199" = icmp ne i32 %".197", 0
  %".200" = and i1 %".198", %".199"
  %".201" = zext i1 %".200" to i32
  ;  Source: b
  %"b.12" = load i32, i32* %"b"
  ;  Source: d
  %"d.6" = load i32, i32* %"d"
  %".204" = icmp eq i32 %"d.6", 0
  %".205" = zext i1 %".204" to i32
  ;  Source: (b&&!d)
  %".207" = icmp ne i32 %"b.12", 0
  %".208" = icmp ne i32 %".205", 0
  %".209" = and i1 %".207", %".208"
  %".210" = zext i1 %".209" to i32
  %".211" = icmp eq i32 %".210", 0
  %".212" = zext i1 %".211" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".214" = icmp ne i32 %".201", 0
  %".215" = icmp ne i32 %".212", 0
  %".216" = or i1 %".214", %".215"
  %".217" = zext i1 %".216" to i32
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".217", i32* %"f"
  %".220" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: f
  %"f.10" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".223" = call i32 (i8*, ...) @"printf"(i8* %".220", i32 %"f.10")
  ;  Source: a
  %"a.11" = load i32, i32* %"a"
  ;  Source: a=0;
  store i32 0, i32* %"a"
  ;  Source: b
  %"b.13" = load i32, i32* %"b"
  ;  Source: b=0;
  store i32 0, i32* %"b"
  ;  Source: c
  %"c.7" = load i32, i32* %"c"
  ;  Source: c=1;
  store i32 1, i32* %"c"
  ;  Source: f
  %"f.11" = load i32, i32* %"f"
  ;  Source: a
  %"a.12" = load i32, i32* %"a"
  ;  Source: b
  %"b.14" = load i32, i32* %"b"
  ;  Source: c
  %"c.8" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".238" = icmp ne i32 %"b.14", 0
  %".239" = icmp ne i32 %"c.8", 0
  %".240" = or i1 %".238", %".239"
  %".241" = zext i1 %".240" to i32
  %".242" = icmp eq i32 %".241", 0
  %".243" = zext i1 %".242" to i32
  %".244" = icmp ne i32 %"a.12", 0
  %".245" = icmp ne i32 %".243", 0
  %".246" = and i1 %".244", %".245"
  %".247" = zext i1 %".246" to i32
  ;  Source: b
  %"b.15" = load i32, i32* %"b"
  ;  Source: d
  %"d.7" = load i32, i32* %"d"
  %".250" = icmp eq i32 %"d.7", 0
  %".251" = zext i1 %".250" to i32
  ;  Source: (b&&!d)
  %".253" = icmp ne i32 %"b.15", 0
  %".254" = icmp ne i32 %".251", 0
  %".255" = and i1 %".253", %".254"
  %".256" = zext i1 %".255" to i32
  %".257" = icmp eq i32 %".256", 0
  %".258" = zext i1 %".257" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".260" = icmp ne i32 %".247", 0
  %".261" = icmp ne i32 %".258", 0
  %".262" = or i1 %".260", %".261"
  %".263" = zext i1 %".262" to i32
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".263", i32* %"f"
  %".266" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: f
  %"f.12" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".269" = call i32 (i8*, ...) @"printf"(i8* %".266", i32 %"f.12")
  ;  Source: a
  %"a.13" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  ;  Source: b
  %"b.16" = load i32, i32* %"b"
  ;  Source: b=0;
  store i32 0, i32* %"b"
  ;  Source: c
  %"c.9" = load i32, i32* %"c"
  ;  Source: c=1;
  store i32 1, i32* %"c"
  ;  Source: f
  %"f.13" = load i32, i32* %"f"
  ;  Source: a
  %"a.14" = load i32, i32* %"a"
  ;  Source: b
  %"b.17" = load i32, i32* %"b"
  ;  Source: c
  %"c.10" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".284" = icmp ne i32 %"b.17", 0
  %".285" = icmp ne i32 %"c.10", 0
  %".286" = or i1 %".284", %".285"
  %".287" = zext i1 %".286" to i32
  %".288" = icmp eq i32 %".287", 0
  %".289" = zext i1 %".288" to i32
  %".290" = icmp ne i32 %"a.14", 0
  %".291" = icmp ne i32 %".289", 0
  %".292" = and i1 %".290", %".291"
  %".293" = zext i1 %".292" to i32
  ;  Source: b
  %"b.18" = load i32, i32* %"b"
  ;  Source: d
  %"d.8" = load i32, i32* %"d"
  %".296" = icmp eq i32 %"d.8", 0
  %".297" = zext i1 %".296" to i32
  ;  Source: (b&&!d)
  %".299" = icmp ne i32 %"b.18", 0
  %".300" = icmp ne i32 %".297", 0
  %".301" = and i1 %".299", %".300"
  %".302" = zext i1 %".301" to i32
  %".303" = icmp eq i32 %".302", 0
  %".304" = zext i1 %".303" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".306" = icmp ne i32 %".293", 0
  %".307" = icmp ne i32 %".304", 0
  %".308" = or i1 %".306", %".307"
  %".309" = zext i1 %".308" to i32
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".309", i32* %"f"
  %".312" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: f
  %"f.14" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".315" = call i32 (i8*, ...) @"printf"(i8* %".312", i32 %"f.14")
  ;  Source: a
  %"a.15" = load i32, i32* %"a"
  ;  Source: a=0;
  store i32 0, i32* %"a"
  ;  Source: b
  %"b.19" = load i32, i32* %"b"
  ;  Source: b=1;
  store i32 1, i32* %"b"
  ;  Source: c
  %"c.11" = load i32, i32* %"c"
  ;  Source: c=1;
  store i32 1, i32* %"c"
  ;  Source: f
  %"f.15" = load i32, i32* %"f"
  ;  Source: a
  %"a.16" = load i32, i32* %"a"
  ;  Source: b
  %"b.20" = load i32, i32* %"b"
  ;  Source: c
  %"c.12" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".330" = icmp ne i32 %"b.20", 0
  %".331" = icmp ne i32 %"c.12", 0
  %".332" = or i1 %".330", %".331"
  %".333" = zext i1 %".332" to i32
  %".334" = icmp eq i32 %".333", 0
  %".335" = zext i1 %".334" to i32
  %".336" = icmp ne i32 %"a.16", 0
  %".337" = icmp ne i32 %".335", 0
  %".338" = and i1 %".336", %".337"
  %".339" = zext i1 %".338" to i32
  ;  Source: b
  %"b.21" = load i32, i32* %"b"
  ;  Source: d
  %"d.9" = load i32, i32* %"d"
  %".342" = icmp eq i32 %"d.9", 0
  %".343" = zext i1 %".342" to i32
  ;  Source: (b&&!d)
  %".345" = icmp ne i32 %"b.21", 0
  %".346" = icmp ne i32 %".343", 0
  %".347" = and i1 %".345", %".346"
  %".348" = zext i1 %".347" to i32
  %".349" = icmp eq i32 %".348", 0
  %".350" = zext i1 %".349" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".352" = icmp ne i32 %".339", 0
  %".353" = icmp ne i32 %".350", 0
  %".354" = or i1 %".352", %".353"
  %".355" = zext i1 %".354" to i32
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".355", i32* %"f"
  %".358" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: f
  %"f.16" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".361" = call i32 (i8*, ...) @"printf"(i8* %".358", i32 %"f.16")
  ;  Source: a
  %"a.17" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  ;  Source: b
  %"b.22" = load i32, i32* %"b"
  ;  Source: b=1;
  store i32 1, i32* %"b"
  ;  Source: c
  %"c.13" = load i32, i32* %"c"
  ;  Source: c=1;
  store i32 1, i32* %"c"
  ;  Source: f
  %"f.17" = load i32, i32* %"f"
  ;  Source: a
  %"a.18" = load i32, i32* %"a"
  ;  Source: b
  %"b.23" = load i32, i32* %"b"
  ;  Source: c
  %"c.14" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".376" = icmp ne i32 %"b.23", 0
  %".377" = icmp ne i32 %"c.14", 0
  %".378" = or i1 %".376", %".377"
  %".379" = zext i1 %".378" to i32
  %".380" = icmp eq i32 %".379", 0
  %".381" = zext i1 %".380" to i32
  %".382" = icmp ne i32 %"a.18", 0
  %".383" = icmp ne i32 %".381", 0
  %".384" = and i1 %".382", %".383"
  %".385" = zext i1 %".384" to i32
  ;  Source: b
  %"b.24" = load i32, i32* %"b"
  ;  Source: d
  %"d.10" = load i32, i32* %"d"
  %".388" = icmp eq i32 %"d.10", 0
  %".389" = zext i1 %".388" to i32
  ;  Source: (b&&!d)
  %".391" = icmp ne i32 %"b.24", 0
  %".392" = icmp ne i32 %".389", 0
  %".393" = and i1 %".391", %".392"
  %".394" = zext i1 %".393" to i32
  %".395" = icmp eq i32 %".394", 0
  %".396" = zext i1 %".395" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".398" = icmp ne i32 %".385", 0
  %".399" = icmp ne i32 %".396", 0
  %".400" = or i1 %".398", %".399"
  %".401" = zext i1 %".400" to i32
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".401", i32* %"f"
  %".404" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: f
  %"f.18" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".407" = call i32 (i8*, ...) @"printf"(i8* %".404", i32 %"f.18")
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