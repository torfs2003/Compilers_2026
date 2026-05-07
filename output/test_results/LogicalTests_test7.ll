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
  %".34" = icmp ne i32 %"b.2", 0
  %".35" = icmp ne i32 %"c.2", 0
  %".36" = or i1 %".34", %".35"
  %".37" = zext i1 %".36" to i32
  ;  Source: (a&&(b||c))
  %".39" = icmp ne i32 %"a.2", 0
  %".40" = icmp ne i32 %".37", 0
  %".41" = and i1 %".39", %".40"
  %".42" = zext i1 %".41" to i32
  ;  Source: d
  %"d.2" = load i32, i32* %"d"
  ;  Source: c
  %"c.3" = load i32, i32* %"c"
  ;  Source: (d&&c)
  %".46" = icmp ne i32 %"d.2", 0
  %".47" = icmp ne i32 %"c.3", 0
  %".48" = and i1 %".46", %".47"
  %".49" = zext i1 %".48" to i32
  ;  Source: e
  %"e.2" = load i32, i32* %"e"
  %".51" = icmp ne i32 %".49", 0
  %".52" = icmp ne i32 %"e.2", 0
  %".53" = and i1 %".51", %".52"
  %".54" = zext i1 %".53" to i32
  ;  Source: (a&&(b||c))||(d&&c)&&e
  %".56" = icmp ne i32 %".42", 0
  %".57" = icmp ne i32 %".54", 0
  %".58" = or i1 %".56", %".57"
  %".59" = zext i1 %".58" to i32
  ;  Source: f=(a&&(b||c))||(d&&c)&&e;
  store i32 %".59", i32* %"f"
  %".62" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f
  %"f.2" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".65" = call i32 (i8*, ...) @"printf"(i8* %".62", i32 %"f.2")
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
  %".74" = icmp ne i32 %"b.3", 0
  %".75" = icmp ne i32 %"c.4", 0
  %".76" = or i1 %".74", %".75"
  %".77" = zext i1 %".76" to i32
  ;  Source: (a&&(b||c))
  %".79" = icmp ne i32 %"a.4", 0
  %".80" = icmp ne i32 %".77", 0
  %".81" = and i1 %".79", %".80"
  %".82" = zext i1 %".81" to i32
  ;  Source: d
  %"d.3" = load i32, i32* %"d"
  ;  Source: c
  %"c.5" = load i32, i32* %"c"
  ;  Source: (d&&c)
  %".86" = icmp ne i32 %"d.3", 0
  %".87" = icmp ne i32 %"c.5", 0
  %".88" = and i1 %".86", %".87"
  %".89" = zext i1 %".88" to i32
  ;  Source: e
  %"e.3" = load i32, i32* %"e"
  %".91" = icmp ne i32 %".89", 0
  %".92" = icmp ne i32 %"e.3", 0
  %".93" = and i1 %".91", %".92"
  %".94" = zext i1 %".93" to i32
  ;  Source: (a&&(b||c))||(d&&c)&&e
  %".96" = icmp ne i32 %".82", 0
  %".97" = icmp ne i32 %".94", 0
  %".98" = or i1 %".96", %".97"
  %".99" = zext i1 %".98" to i32
  ;  Source: f=(a&&(b||c))||(d&&c)&&e;
  store i32 %".99", i32* %"f"
  %".102" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: f
  %"f.4" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".105" = call i32 (i8*, ...) @"printf"(i8* %".102", i32 %"f.4")
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
  %".114" = icmp ne i32 %"b.5", 0
  %".115" = icmp ne i32 %"c.6", 0
  %".116" = or i1 %".114", %".115"
  %".117" = zext i1 %".116" to i32
  ;  Source: (a&&(b||c))
  %".119" = icmp ne i32 %"a.5", 0
  %".120" = icmp ne i32 %".117", 0
  %".121" = and i1 %".119", %".120"
  %".122" = zext i1 %".121" to i32
  ;  Source: d
  %"d.4" = load i32, i32* %"d"
  ;  Source: c
  %"c.7" = load i32, i32* %"c"
  ;  Source: (d&&c)
  %".126" = icmp ne i32 %"d.4", 0
  %".127" = icmp ne i32 %"c.7", 0
  %".128" = and i1 %".126", %".127"
  %".129" = zext i1 %".128" to i32
  ;  Source: e
  %"e.4" = load i32, i32* %"e"
  %".131" = icmp ne i32 %".129", 0
  %".132" = icmp ne i32 %"e.4", 0
  %".133" = and i1 %".131", %".132"
  %".134" = zext i1 %".133" to i32
  ;  Source: (a&&(b||c))||(d&&c)&&e
  %".136" = icmp ne i32 %".122", 0
  %".137" = icmp ne i32 %".134", 0
  %".138" = or i1 %".136", %".137"
  %".139" = zext i1 %".138" to i32
  ;  Source: f=(a&&(b||c))||(d&&c)&&e;
  store i32 %".139", i32* %"f"
  %".142" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: f
  %"f.6" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".145" = call i32 (i8*, ...) @"printf"(i8* %".142", i32 %"f.6")
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
  %".154" = icmp ne i32 %"b.6", 0
  %".155" = icmp ne i32 %"c.9", 0
  %".156" = or i1 %".154", %".155"
  %".157" = zext i1 %".156" to i32
  ;  Source: (a&&(b||c))
  %".159" = icmp ne i32 %"a.6", 0
  %".160" = icmp ne i32 %".157", 0
  %".161" = and i1 %".159", %".160"
  %".162" = zext i1 %".161" to i32
  ;  Source: d
  %"d.5" = load i32, i32* %"d"
  ;  Source: c
  %"c.10" = load i32, i32* %"c"
  ;  Source: (d&&c)
  %".166" = icmp ne i32 %"d.5", 0
  %".167" = icmp ne i32 %"c.10", 0
  %".168" = and i1 %".166", %".167"
  %".169" = zext i1 %".168" to i32
  ;  Source: e
  %"e.5" = load i32, i32* %"e"
  %".171" = icmp ne i32 %".169", 0
  %".172" = icmp ne i32 %"e.5", 0
  %".173" = and i1 %".171", %".172"
  %".174" = zext i1 %".173" to i32
  ;  Source: (a&&(b||c))||(d&&c)&&e
  %".176" = icmp ne i32 %".162", 0
  %".177" = icmp ne i32 %".174", 0
  %".178" = or i1 %".176", %".177"
  %".179" = zext i1 %".178" to i32
  ;  Source: f=(a&&(b||c))||(d&&c)&&e;
  store i32 %".179", i32* %"f"
  %".182" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: f
  %"f.8" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".185" = call i32 (i8*, ...) @"printf"(i8* %".182", i32 %"f.8")
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
  %".194" = icmp ne i32 %"b.7", 0
  %".195" = icmp ne i32 %"c.11", 0
  %".196" = or i1 %".194", %".195"
  %".197" = zext i1 %".196" to i32
  ;  Source: (a&&(b||c))
  %".199" = icmp ne i32 %"a.7", 0
  %".200" = icmp ne i32 %".197", 0
  %".201" = and i1 %".199", %".200"
  %".202" = zext i1 %".201" to i32
  ;  Source: d
  %"d.7" = load i32, i32* %"d"
  ;  Source: c
  %"c.12" = load i32, i32* %"c"
  ;  Source: (d&&c)
  %".206" = icmp ne i32 %"d.7", 0
  %".207" = icmp ne i32 %"c.12", 0
  %".208" = and i1 %".206", %".207"
  %".209" = zext i1 %".208" to i32
  ;  Source: e
  %"e.6" = load i32, i32* %"e"
  %".211" = icmp ne i32 %".209", 0
  %".212" = icmp ne i32 %"e.6", 0
  %".213" = and i1 %".211", %".212"
  %".214" = zext i1 %".213" to i32
  ;  Source: (a&&(b||c))||(d&&c)&&e
  %".216" = icmp ne i32 %".202", 0
  %".217" = icmp ne i32 %".214", 0
  %".218" = or i1 %".216", %".217"
  %".219" = zext i1 %".218" to i32
  ;  Source: f=(a&&(b||c))||(d&&c)&&e;
  store i32 %".219", i32* %"f"
  %".222" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: f
  %"f.10" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".225" = call i32 (i8*, ...) @"printf"(i8* %".222", i32 %"f.10")
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
  %".234" = icmp ne i32 %"b.8", 0
  %".235" = icmp ne i32 %"c.13", 0
  %".236" = or i1 %".234", %".235"
  %".237" = zext i1 %".236" to i32
  ;  Source: (a&&(b||c))
  %".239" = icmp ne i32 %"a.8", 0
  %".240" = icmp ne i32 %".237", 0
  %".241" = and i1 %".239", %".240"
  %".242" = zext i1 %".241" to i32
  ;  Source: d
  %"d.8" = load i32, i32* %"d"
  ;  Source: c
  %"c.14" = load i32, i32* %"c"
  ;  Source: (d&&c)
  %".246" = icmp ne i32 %"d.8", 0
  %".247" = icmp ne i32 %"c.14", 0
  %".248" = and i1 %".246", %".247"
  %".249" = zext i1 %".248" to i32
  ;  Source: e
  %"e.8" = load i32, i32* %"e"
  %".251" = icmp ne i32 %".249", 0
  %".252" = icmp ne i32 %"e.8", 0
  %".253" = and i1 %".251", %".252"
  %".254" = zext i1 %".253" to i32
  ;  Source: (a&&(b||c))||(d&&c)&&e
  %".256" = icmp ne i32 %".242", 0
  %".257" = icmp ne i32 %".254", 0
  %".258" = or i1 %".256", %".257"
  %".259" = zext i1 %".258" to i32
  ;  Source: f=(a&&(b||c))||(d&&c)&&e;
  store i32 %".259", i32* %"f"
  %".262" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: f
  %"f.12" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".265" = call i32 (i8*, ...) @"printf"(i8* %".262", i32 %"f.12")
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
  %".274" = icmp ne i32 %"b.10", 0
  %".275" = icmp ne i32 %"c.15", 0
  %".276" = or i1 %".274", %".275"
  %".277" = zext i1 %".276" to i32
  ;  Source: (a&&(b||c))
  %".279" = icmp ne i32 %"a.9", 0
  %".280" = icmp ne i32 %".277", 0
  %".281" = and i1 %".279", %".280"
  %".282" = zext i1 %".281" to i32
  ;  Source: d
  %"d.9" = load i32, i32* %"d"
  ;  Source: c
  %"c.16" = load i32, i32* %"c"
  ;  Source: (d&&c)
  %".286" = icmp ne i32 %"d.9", 0
  %".287" = icmp ne i32 %"c.16", 0
  %".288" = and i1 %".286", %".287"
  %".289" = zext i1 %".288" to i32
  ;  Source: e
  %"e.9" = load i32, i32* %"e"
  %".291" = icmp ne i32 %".289", 0
  %".292" = icmp ne i32 %"e.9", 0
  %".293" = and i1 %".291", %".292"
  %".294" = zext i1 %".293" to i32
  ;  Source: (a&&(b||c))||(d&&c)&&e
  %".296" = icmp ne i32 %".282", 0
  %".297" = icmp ne i32 %".294", 0
  %".298" = or i1 %".296", %".297"
  %".299" = zext i1 %".298" to i32
  ;  Source: f=(a&&(b||c))||(d&&c)&&e;
  store i32 %".299", i32* %"f"
  %".302" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: f
  %"f.14" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".305" = call i32 (i8*, ...) @"printf"(i8* %".302", i32 %"f.14")
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
  %".314" = icmp ne i32 %"b.11", 0
  %".315" = icmp ne i32 %"c.18", 0
  %".316" = or i1 %".314", %".315"
  %".317" = zext i1 %".316" to i32
  ;  Source: (a&&(b||c))
  %".319" = icmp ne i32 %"a.10", 0
  %".320" = icmp ne i32 %".317", 0
  %".321" = and i1 %".319", %".320"
  %".322" = zext i1 %".321" to i32
  ;  Source: d
  %"d.10" = load i32, i32* %"d"
  ;  Source: c
  %"c.19" = load i32, i32* %"c"
  ;  Source: (d&&c)
  %".326" = icmp ne i32 %"d.10", 0
  %".327" = icmp ne i32 %"c.19", 0
  %".328" = and i1 %".326", %".327"
  %".329" = zext i1 %".328" to i32
  ;  Source: e
  %"e.10" = load i32, i32* %"e"
  %".331" = icmp ne i32 %".329", 0
  %".332" = icmp ne i32 %"e.10", 0
  %".333" = and i1 %".331", %".332"
  %".334" = zext i1 %".333" to i32
  ;  Source: (a&&(b||c))||(d&&c)&&e
  %".336" = icmp ne i32 %".322", 0
  %".337" = icmp ne i32 %".334", 0
  %".338" = or i1 %".336", %".337"
  %".339" = zext i1 %".338" to i32
  ;  Source: f=(a&&(b||c))||(d&&c)&&e;
  store i32 %".339", i32* %"f"
  %".342" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: f
  %"f.16" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".345" = call i32 (i8*, ...) @"printf"(i8* %".342", i32 %"f.16")
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
  %".354" = icmp ne i32 %"b.12", 0
  %".355" = icmp ne i32 %"c.20", 0
  %".356" = or i1 %".354", %".355"
  %".357" = zext i1 %".356" to i32
  ;  Source: (a&&(b||c))
  %".359" = icmp ne i32 %"a.11", 0
  %".360" = icmp ne i32 %".357", 0
  %".361" = and i1 %".359", %".360"
  %".362" = zext i1 %".361" to i32
  ;  Source: d
  %"d.12" = load i32, i32* %"d"
  ;  Source: c
  %"c.21" = load i32, i32* %"c"
  ;  Source: (d&&c)
  %".366" = icmp ne i32 %"d.12", 0
  %".367" = icmp ne i32 %"c.21", 0
  %".368" = and i1 %".366", %".367"
  %".369" = zext i1 %".368" to i32
  ;  Source: e
  %"e.11" = load i32, i32* %"e"
  %".371" = icmp ne i32 %".369", 0
  %".372" = icmp ne i32 %"e.11", 0
  %".373" = and i1 %".371", %".372"
  %".374" = zext i1 %".373" to i32
  ;  Source: (a&&(b||c))||(d&&c)&&e
  %".376" = icmp ne i32 %".362", 0
  %".377" = icmp ne i32 %".374", 0
  %".378" = or i1 %".376", %".377"
  %".379" = zext i1 %".378" to i32
  ;  Source: f=(a&&(b||c))||(d&&c)&&e;
  store i32 %".379", i32* %"f"
  %".382" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: f
  %"f.18" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".385" = call i32 (i8*, ...) @"printf"(i8* %".382", i32 %"f.18")
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