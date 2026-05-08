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
  ;  Source: b
  %"b_load.1" = load i32, i32* %"b"
  ;  Source: c
  %"c_load.1" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".28" = icmp ne i32 %"b_load.1", 0
  %".29" = icmp ne i32 %"c_load.1", 0
  %".30" = or i1 %".28", %".29"
  %".31" = zext i1 %".30" to i32
  %".32" = icmp eq i32 %".31", 0
  %".33" = zext i1 %".32" to i32
  %".34" = icmp ne i32 %"a_load.1", 0
  %".35" = icmp ne i32 %".33", 0
  %".36" = and i1 %".34", %".35"
  %".37" = zext i1 %".36" to i32
  ;  Source: b
  %"b_load.2" = load i32, i32* %"b"
  ;  Source: d
  %"d_load.1" = load i32, i32* %"d"
  %".40" = icmp eq i32 %"d_load.1", 0
  %".41" = zext i1 %".40" to i32
  %".42" = icmp ne i32 %"b_load.2", 0
  %".43" = icmp ne i32 %".41", 0
  %".44" = and i1 %".42", %".43"
  %".45" = zext i1 %".44" to i32
  ;  Source: e
  %"e_load.1" = load i32, i32* %"e"
  ;  Source: a
  %"a_load.2" = load i32, i32* %"a"
  %".48" = icmp eq i32 %"a_load.2", 0
  %".49" = zext i1 %".48" to i32
  ;  Source: (e&&!a)
  %".51" = icmp ne i32 %"e_load.1", 0
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
  %"f_load.1" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".72" = call i32 (i8*, ...) @"printf"(i8* %".69", i32 %"f_load.1")
  ;  Source: a
  %"a_load.3" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  ;  Source: f
  %"f_load.2" = load i32, i32* %"f"
  ;  Source: a
  %"a_load.4" = load i32, i32* %"a"
  ;  Source: b
  %"b_load.3" = load i32, i32* %"b"
  ;  Source: c
  %"c_load.2" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".81" = icmp ne i32 %"b_load.3", 0
  %".82" = icmp ne i32 %"c_load.2", 0
  %".83" = or i1 %".81", %".82"
  %".84" = zext i1 %".83" to i32
  %".85" = icmp eq i32 %".84", 0
  %".86" = zext i1 %".85" to i32
  ;  Source: (a&&!(b||c))
  %".88" = icmp ne i32 %"a_load.4", 0
  %".89" = icmp ne i32 %".86", 0
  %".90" = and i1 %".88", %".89"
  %".91" = zext i1 %".90" to i32
  ;  Source: f=(a&&!(b||c));
  store i32 %".91", i32* %"f"
  %".94" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: f
  %"f_load.3" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".97" = call i32 (i8*, ...) @"printf"(i8* %".94", i32 %"f_load.3")
  ;  Source: f
  %"f_load.4" = load i32, i32* %"f"
  ;  Source: a
  %"a_load.5" = load i32, i32* %"a"
  ;  Source: b
  %"b_load.4" = load i32, i32* %"b"
  ;  Source: c
  %"c_load.3" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".103" = icmp ne i32 %"b_load.4", 0
  %".104" = icmp ne i32 %"c_load.3", 0
  %".105" = or i1 %".103", %".104"
  %".106" = zext i1 %".105" to i32
  %".107" = icmp eq i32 %".106", 0
  %".108" = zext i1 %".107" to i32
  %".109" = icmp ne i32 %"a_load.5", 0
  %".110" = icmp ne i32 %".108", 0
  %".111" = and i1 %".109", %".110"
  %".112" = zext i1 %".111" to i32
  ;  Source: b
  %"b_load.5" = load i32, i32* %"b"
  ;  Source: d
  %"d_load.2" = load i32, i32* %"d"
  %".115" = icmp eq i32 %"d_load.2", 0
  %".116" = zext i1 %".115" to i32
  ;  Source: (b&&!d)
  %".118" = icmp ne i32 %"b_load.5", 0
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
  %"f_load.5" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".134" = call i32 (i8*, ...) @"printf"(i8* %".131", i32 %"f_load.5")
  ;  Source: a
  %"a_load.6" = load i32, i32* %"a"
  ;  Source: a=0;
  store i32 0, i32* %"a"
  ;  Source: b
  %"b_load.6" = load i32, i32* %"b"
  ;  Source: b=1;
  store i32 1, i32* %"b"
  ;  Source: f
  %"f_load.6" = load i32, i32* %"f"
  ;  Source: a
  %"a_load.7" = load i32, i32* %"a"
  ;  Source: b
  %"b_load.7" = load i32, i32* %"b"
  ;  Source: c
  %"c_load.4" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".146" = icmp ne i32 %"b_load.7", 0
  %".147" = icmp ne i32 %"c_load.4", 0
  %".148" = or i1 %".146", %".147"
  %".149" = zext i1 %".148" to i32
  %".150" = icmp eq i32 %".149", 0
  %".151" = zext i1 %".150" to i32
  %".152" = icmp ne i32 %"a_load.7", 0
  %".153" = icmp ne i32 %".151", 0
  %".154" = and i1 %".152", %".153"
  %".155" = zext i1 %".154" to i32
  ;  Source: b
  %"b_load.8" = load i32, i32* %"b"
  ;  Source: d
  %"d_load.3" = load i32, i32* %"d"
  %".158" = icmp eq i32 %"d_load.3", 0
  %".159" = zext i1 %".158" to i32
  ;  Source: (b&&!d)
  %".161" = icmp ne i32 %"b_load.8", 0
  %".162" = icmp ne i32 %".159", 0
  %".163" = and i1 %".161", %".162"
  %".164" = zext i1 %".163" to i32
  %".165" = icmp eq i32 %".164", 0
  %".166" = zext i1 %".165" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".168" = icmp ne i32 %".155", 0
  %".169" = icmp ne i32 %".166", 0
  %".170" = or i1 %".168", %".169"
  %".171" = zext i1 %".170" to i32
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".171", i32* %"f"
  %".174" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: f
  %"f_load.7" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".177" = call i32 (i8*, ...) @"printf"(i8* %".174", i32 %"f_load.7")
  ;  Source: a
  %"a_load.8" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  ;  Source: b
  %"b_load.9" = load i32, i32* %"b"
  ;  Source: b=1;
  store i32 1, i32* %"b"
  ;  Source: f
  %"f_load.8" = load i32, i32* %"f"
  ;  Source: a
  %"a_load.9" = load i32, i32* %"a"
  ;  Source: b
  %"b_load.10" = load i32, i32* %"b"
  ;  Source: c
  %"c_load.5" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".189" = icmp ne i32 %"b_load.10", 0
  %".190" = icmp ne i32 %"c_load.5", 0
  %".191" = or i1 %".189", %".190"
  %".192" = zext i1 %".191" to i32
  %".193" = icmp eq i32 %".192", 0
  %".194" = zext i1 %".193" to i32
  %".195" = icmp ne i32 %"a_load.9", 0
  %".196" = icmp ne i32 %".194", 0
  %".197" = and i1 %".195", %".196"
  %".198" = zext i1 %".197" to i32
  ;  Source: b
  %"b_load.11" = load i32, i32* %"b"
  ;  Source: d
  %"d_load.4" = load i32, i32* %"d"
  %".201" = icmp eq i32 %"d_load.4", 0
  %".202" = zext i1 %".201" to i32
  ;  Source: (b&&!d)
  %".204" = icmp ne i32 %"b_load.11", 0
  %".205" = icmp ne i32 %".202", 0
  %".206" = and i1 %".204", %".205"
  %".207" = zext i1 %".206" to i32
  %".208" = icmp eq i32 %".207", 0
  %".209" = zext i1 %".208" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".211" = icmp ne i32 %".198", 0
  %".212" = icmp ne i32 %".209", 0
  %".213" = or i1 %".211", %".212"
  %".214" = zext i1 %".213" to i32
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".214", i32* %"f"
  %".217" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: f
  %"f_load.9" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".220" = call i32 (i8*, ...) @"printf"(i8* %".217", i32 %"f_load.9")
  ;  Source: a
  %"a_load.10" = load i32, i32* %"a"
  ;  Source: a=0;
  store i32 0, i32* %"a"
  ;  Source: b
  %"b_load.12" = load i32, i32* %"b"
  ;  Source: b=0;
  store i32 0, i32* %"b"
  ;  Source: c
  %"c_load.6" = load i32, i32* %"c"
  ;  Source: c=1;
  store i32 1, i32* %"c"
  ;  Source: f
  %"f_load.10" = load i32, i32* %"f"
  ;  Source: a
  %"a_load.11" = load i32, i32* %"a"
  ;  Source: b
  %"b_load.13" = load i32, i32* %"b"
  ;  Source: c
  %"c_load.7" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".235" = icmp ne i32 %"b_load.13", 0
  %".236" = icmp ne i32 %"c_load.7", 0
  %".237" = or i1 %".235", %".236"
  %".238" = zext i1 %".237" to i32
  %".239" = icmp eq i32 %".238", 0
  %".240" = zext i1 %".239" to i32
  %".241" = icmp ne i32 %"a_load.11", 0
  %".242" = icmp ne i32 %".240", 0
  %".243" = and i1 %".241", %".242"
  %".244" = zext i1 %".243" to i32
  ;  Source: b
  %"b_load.14" = load i32, i32* %"b"
  ;  Source: d
  %"d_load.5" = load i32, i32* %"d"
  %".247" = icmp eq i32 %"d_load.5", 0
  %".248" = zext i1 %".247" to i32
  ;  Source: (b&&!d)
  %".250" = icmp ne i32 %"b_load.14", 0
  %".251" = icmp ne i32 %".248", 0
  %".252" = and i1 %".250", %".251"
  %".253" = zext i1 %".252" to i32
  %".254" = icmp eq i32 %".253", 0
  %".255" = zext i1 %".254" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".257" = icmp ne i32 %".244", 0
  %".258" = icmp ne i32 %".255", 0
  %".259" = or i1 %".257", %".258"
  %".260" = zext i1 %".259" to i32
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".260", i32* %"f"
  %".263" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: f
  %"f_load.11" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".266" = call i32 (i8*, ...) @"printf"(i8* %".263", i32 %"f_load.11")
  ;  Source: a
  %"a_load.12" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  ;  Source: b
  %"b_load.15" = load i32, i32* %"b"
  ;  Source: b=0;
  store i32 0, i32* %"b"
  ;  Source: c
  %"c_load.8" = load i32, i32* %"c"
  ;  Source: c=1;
  store i32 1, i32* %"c"
  ;  Source: f
  %"f_load.12" = load i32, i32* %"f"
  ;  Source: a
  %"a_load.13" = load i32, i32* %"a"
  ;  Source: b
  %"b_load.16" = load i32, i32* %"b"
  ;  Source: c
  %"c_load.9" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".281" = icmp ne i32 %"b_load.16", 0
  %".282" = icmp ne i32 %"c_load.9", 0
  %".283" = or i1 %".281", %".282"
  %".284" = zext i1 %".283" to i32
  %".285" = icmp eq i32 %".284", 0
  %".286" = zext i1 %".285" to i32
  %".287" = icmp ne i32 %"a_load.13", 0
  %".288" = icmp ne i32 %".286", 0
  %".289" = and i1 %".287", %".288"
  %".290" = zext i1 %".289" to i32
  ;  Source: b
  %"b_load.17" = load i32, i32* %"b"
  ;  Source: d
  %"d_load.6" = load i32, i32* %"d"
  %".293" = icmp eq i32 %"d_load.6", 0
  %".294" = zext i1 %".293" to i32
  ;  Source: (b&&!d)
  %".296" = icmp ne i32 %"b_load.17", 0
  %".297" = icmp ne i32 %".294", 0
  %".298" = and i1 %".296", %".297"
  %".299" = zext i1 %".298" to i32
  %".300" = icmp eq i32 %".299", 0
  %".301" = zext i1 %".300" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".303" = icmp ne i32 %".290", 0
  %".304" = icmp ne i32 %".301", 0
  %".305" = or i1 %".303", %".304"
  %".306" = zext i1 %".305" to i32
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".306", i32* %"f"
  %".309" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: f
  %"f_load.13" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".312" = call i32 (i8*, ...) @"printf"(i8* %".309", i32 %"f_load.13")
  ;  Source: a
  %"a_load.14" = load i32, i32* %"a"
  ;  Source: a=0;
  store i32 0, i32* %"a"
  ;  Source: b
  %"b_load.18" = load i32, i32* %"b"
  ;  Source: b=1;
  store i32 1, i32* %"b"
  ;  Source: c
  %"c_load.10" = load i32, i32* %"c"
  ;  Source: c=1;
  store i32 1, i32* %"c"
  ;  Source: f
  %"f_load.14" = load i32, i32* %"f"
  ;  Source: a
  %"a_load.15" = load i32, i32* %"a"
  ;  Source: b
  %"b_load.19" = load i32, i32* %"b"
  ;  Source: c
  %"c_load.11" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".327" = icmp ne i32 %"b_load.19", 0
  %".328" = icmp ne i32 %"c_load.11", 0
  %".329" = or i1 %".327", %".328"
  %".330" = zext i1 %".329" to i32
  %".331" = icmp eq i32 %".330", 0
  %".332" = zext i1 %".331" to i32
  %".333" = icmp ne i32 %"a_load.15", 0
  %".334" = icmp ne i32 %".332", 0
  %".335" = and i1 %".333", %".334"
  %".336" = zext i1 %".335" to i32
  ;  Source: b
  %"b_load.20" = load i32, i32* %"b"
  ;  Source: d
  %"d_load.7" = load i32, i32* %"d"
  %".339" = icmp eq i32 %"d_load.7", 0
  %".340" = zext i1 %".339" to i32
  ;  Source: (b&&!d)
  %".342" = icmp ne i32 %"b_load.20", 0
  %".343" = icmp ne i32 %".340", 0
  %".344" = and i1 %".342", %".343"
  %".345" = zext i1 %".344" to i32
  %".346" = icmp eq i32 %".345", 0
  %".347" = zext i1 %".346" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".349" = icmp ne i32 %".336", 0
  %".350" = icmp ne i32 %".347", 0
  %".351" = or i1 %".349", %".350"
  %".352" = zext i1 %".351" to i32
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".352", i32* %"f"
  %".355" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: f
  %"f_load.15" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".358" = call i32 (i8*, ...) @"printf"(i8* %".355", i32 %"f_load.15")
  ;  Source: a
  %"a_load.16" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  ;  Source: b
  %"b_load.21" = load i32, i32* %"b"
  ;  Source: b=1;
  store i32 1, i32* %"b"
  ;  Source: c
  %"c_load.12" = load i32, i32* %"c"
  ;  Source: c=1;
  store i32 1, i32* %"c"
  ;  Source: f
  %"f_load.16" = load i32, i32* %"f"
  ;  Source: a
  %"a_load.17" = load i32, i32* %"a"
  ;  Source: b
  %"b_load.22" = load i32, i32* %"b"
  ;  Source: c
  %"c_load.13" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".373" = icmp ne i32 %"b_load.22", 0
  %".374" = icmp ne i32 %"c_load.13", 0
  %".375" = or i1 %".373", %".374"
  %".376" = zext i1 %".375" to i32
  %".377" = icmp eq i32 %".376", 0
  %".378" = zext i1 %".377" to i32
  %".379" = icmp ne i32 %"a_load.17", 0
  %".380" = icmp ne i32 %".378", 0
  %".381" = and i1 %".379", %".380"
  %".382" = zext i1 %".381" to i32
  ;  Source: b
  %"b_load.23" = load i32, i32* %"b"
  ;  Source: d
  %"d_load.8" = load i32, i32* %"d"
  %".385" = icmp eq i32 %"d_load.8", 0
  %".386" = zext i1 %".385" to i32
  ;  Source: (b&&!d)
  %".388" = icmp ne i32 %"b_load.23", 0
  %".389" = icmp ne i32 %".386", 0
  %".390" = and i1 %".388", %".389"
  %".391" = zext i1 %".390" to i32
  %".392" = icmp eq i32 %".391", 0
  %".393" = zext i1 %".392" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".395" = icmp ne i32 %".382", 0
  %".396" = icmp ne i32 %".393", 0
  %".397" = or i1 %".395", %".396"
  %".398" = zext i1 %".397" to i32
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".398", i32* %"f"
  %".401" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: f
  %"f_load.17" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".404" = call i32 (i8*, ...) @"printf"(i8* %".401", i32 %"f_load.17")
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