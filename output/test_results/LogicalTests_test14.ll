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

declare i8* @"calloc"(i32 %".1", i32 %".2")

declare i8* @"realloc"(i8* %".1", i32 %".2")

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
  %".38" = icmp eq i32 %".37", 0
  %".39" = zext i1 %".38" to i32
  %".40" = icmp ne i32 %"a.2", 0
  %".41" = icmp ne i32 %".39", 0
  %".42" = and i1 %".40", %".41"
  %".43" = zext i1 %".42" to i32
  ;  Source: b
  %"b.3" = load i32, i32* %"b"
  ;  Source: d
  %"d.2" = load i32, i32* %"d"
  %".46" = icmp eq i32 %"d.2", 0
  %".47" = zext i1 %".46" to i32
  %".48" = icmp ne i32 %"b.3", 0
  %".49" = icmp ne i32 %".47", 0
  %".50" = and i1 %".48", %".49"
  %".51" = zext i1 %".50" to i32
  ;  Source: e
  %"e.2" = load i32, i32* %"e"
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  %".54" = icmp eq i32 %"a.3", 0
  %".55" = zext i1 %".54" to i32
  ;  Source: (e&&!a)
  %".57" = icmp ne i32 %"e.2", 0
  %".58" = icmp ne i32 %".55", 0
  %".59" = and i1 %".57", %".58"
  %".60" = zext i1 %".59" to i32
  ;  Source: (b&&!d||(e&&!a))
  %".62" = icmp ne i32 %".51", 0
  %".63" = icmp ne i32 %".60", 0
  %".64" = or i1 %".62", %".63"
  %".65" = zext i1 %".64" to i32
  %".66" = icmp eq i32 %".65", 0
  %".67" = zext i1 %".66" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d||(e&&!a)))
  %".69" = icmp ne i32 %".43", 0
  %".70" = icmp ne i32 %".67", 0
  %".71" = or i1 %".69", %".70"
  %".72" = zext i1 %".71" to i32
  ;  Source: f=(a&&!(b||c)||!(b&&!d||(e&&!a)));
  store i32 %".72", i32* %"f"
  %".75" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f
  %"f.2" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".78" = call i32 (i8*, ...) @"printf"(i8* %".75", i32 %"f.2")
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
  %".87" = icmp ne i32 %"b.4", 0
  %".88" = icmp ne i32 %"c.3", 0
  %".89" = or i1 %".87", %".88"
  %".90" = zext i1 %".89" to i32
  %".91" = icmp eq i32 %".90", 0
  %".92" = zext i1 %".91" to i32
  ;  Source: (a&&!(b||c))
  %".94" = icmp ne i32 %"a.5", 0
  %".95" = icmp ne i32 %".92", 0
  %".96" = and i1 %".94", %".95"
  %".97" = zext i1 %".96" to i32
  ;  Source: f=(a&&!(b||c));
  store i32 %".97", i32* %"f"
  %".100" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: f
  %"f.4" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".103" = call i32 (i8*, ...) @"printf"(i8* %".100", i32 %"f.4")
  ;  Source: f
  %"f.5" = load i32, i32* %"f"
  ;  Source: a
  %"a.6" = load i32, i32* %"a"
  ;  Source: b
  %"b.5" = load i32, i32* %"b"
  ;  Source: c
  %"c.4" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".109" = icmp ne i32 %"b.5", 0
  %".110" = icmp ne i32 %"c.4", 0
  %".111" = or i1 %".109", %".110"
  %".112" = zext i1 %".111" to i32
  %".113" = icmp eq i32 %".112", 0
  %".114" = zext i1 %".113" to i32
  %".115" = icmp ne i32 %"a.6", 0
  %".116" = icmp ne i32 %".114", 0
  %".117" = and i1 %".115", %".116"
  %".118" = zext i1 %".117" to i32
  ;  Source: b
  %"b.6" = load i32, i32* %"b"
  ;  Source: d
  %"d.3" = load i32, i32* %"d"
  %".121" = icmp eq i32 %"d.3", 0
  %".122" = zext i1 %".121" to i32
  ;  Source: (b&&!d)
  %".124" = icmp ne i32 %"b.6", 0
  %".125" = icmp ne i32 %".122", 0
  %".126" = and i1 %".124", %".125"
  %".127" = zext i1 %".126" to i32
  %".128" = icmp eq i32 %".127", 0
  %".129" = zext i1 %".128" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".131" = icmp ne i32 %".118", 0
  %".132" = icmp ne i32 %".129", 0
  %".133" = or i1 %".131", %".132"
  %".134" = zext i1 %".133" to i32
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".134", i32* %"f"
  %".137" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: f
  %"f.6" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".140" = call i32 (i8*, ...) @"printf"(i8* %".137", i32 %"f.6")
  ;  Source: a
  %"a.7" = load i32, i32* %"a"
  ;  Source: a=0;
  store i32 0, i32* %"a"
  ;  Source: b
  %"b.7" = load i32, i32* %"b"
  ;  Source: b=1;
  store i32 1, i32* %"b"
  ;  Source: f
  %"f.7" = load i32, i32* %"f"
  ;  Source: a
  %"a.8" = load i32, i32* %"a"
  ;  Source: b
  %"b.8" = load i32, i32* %"b"
  ;  Source: c
  %"c.5" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".152" = icmp ne i32 %"b.8", 0
  %".153" = icmp ne i32 %"c.5", 0
  %".154" = or i1 %".152", %".153"
  %".155" = zext i1 %".154" to i32
  %".156" = icmp eq i32 %".155", 0
  %".157" = zext i1 %".156" to i32
  %".158" = icmp ne i32 %"a.8", 0
  %".159" = icmp ne i32 %".157", 0
  %".160" = and i1 %".158", %".159"
  %".161" = zext i1 %".160" to i32
  ;  Source: b
  %"b.9" = load i32, i32* %"b"
  ;  Source: d
  %"d.4" = load i32, i32* %"d"
  %".164" = icmp eq i32 %"d.4", 0
  %".165" = zext i1 %".164" to i32
  ;  Source: (b&&!d)
  %".167" = icmp ne i32 %"b.9", 0
  %".168" = icmp ne i32 %".165", 0
  %".169" = and i1 %".167", %".168"
  %".170" = zext i1 %".169" to i32
  %".171" = icmp eq i32 %".170", 0
  %".172" = zext i1 %".171" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".174" = icmp ne i32 %".161", 0
  %".175" = icmp ne i32 %".172", 0
  %".176" = or i1 %".174", %".175"
  %".177" = zext i1 %".176" to i32
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".177", i32* %"f"
  %".180" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: f
  %"f.8" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".183" = call i32 (i8*, ...) @"printf"(i8* %".180", i32 %"f.8")
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
  %".195" = icmp ne i32 %"b.11", 0
  %".196" = icmp ne i32 %"c.6", 0
  %".197" = or i1 %".195", %".196"
  %".198" = zext i1 %".197" to i32
  %".199" = icmp eq i32 %".198", 0
  %".200" = zext i1 %".199" to i32
  %".201" = icmp ne i32 %"a.10", 0
  %".202" = icmp ne i32 %".200", 0
  %".203" = and i1 %".201", %".202"
  %".204" = zext i1 %".203" to i32
  ;  Source: b
  %"b.12" = load i32, i32* %"b"
  ;  Source: d
  %"d.5" = load i32, i32* %"d"
  %".207" = icmp eq i32 %"d.5", 0
  %".208" = zext i1 %".207" to i32
  ;  Source: (b&&!d)
  %".210" = icmp ne i32 %"b.12", 0
  %".211" = icmp ne i32 %".208", 0
  %".212" = and i1 %".210", %".211"
  %".213" = zext i1 %".212" to i32
  %".214" = icmp eq i32 %".213", 0
  %".215" = zext i1 %".214" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".217" = icmp ne i32 %".204", 0
  %".218" = icmp ne i32 %".215", 0
  %".219" = or i1 %".217", %".218"
  %".220" = zext i1 %".219" to i32
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".220", i32* %"f"
  %".223" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: f
  %"f.10" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".226" = call i32 (i8*, ...) @"printf"(i8* %".223", i32 %"f.10")
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
  %".241" = icmp ne i32 %"b.14", 0
  %".242" = icmp ne i32 %"c.8", 0
  %".243" = or i1 %".241", %".242"
  %".244" = zext i1 %".243" to i32
  %".245" = icmp eq i32 %".244", 0
  %".246" = zext i1 %".245" to i32
  %".247" = icmp ne i32 %"a.12", 0
  %".248" = icmp ne i32 %".246", 0
  %".249" = and i1 %".247", %".248"
  %".250" = zext i1 %".249" to i32
  ;  Source: b
  %"b.15" = load i32, i32* %"b"
  ;  Source: d
  %"d.6" = load i32, i32* %"d"
  %".253" = icmp eq i32 %"d.6", 0
  %".254" = zext i1 %".253" to i32
  ;  Source: (b&&!d)
  %".256" = icmp ne i32 %"b.15", 0
  %".257" = icmp ne i32 %".254", 0
  %".258" = and i1 %".256", %".257"
  %".259" = zext i1 %".258" to i32
  %".260" = icmp eq i32 %".259", 0
  %".261" = zext i1 %".260" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".263" = icmp ne i32 %".250", 0
  %".264" = icmp ne i32 %".261", 0
  %".265" = or i1 %".263", %".264"
  %".266" = zext i1 %".265" to i32
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".266", i32* %"f"
  %".269" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: f
  %"f.12" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".272" = call i32 (i8*, ...) @"printf"(i8* %".269", i32 %"f.12")
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
  %".287" = icmp ne i32 %"b.17", 0
  %".288" = icmp ne i32 %"c.10", 0
  %".289" = or i1 %".287", %".288"
  %".290" = zext i1 %".289" to i32
  %".291" = icmp eq i32 %".290", 0
  %".292" = zext i1 %".291" to i32
  %".293" = icmp ne i32 %"a.14", 0
  %".294" = icmp ne i32 %".292", 0
  %".295" = and i1 %".293", %".294"
  %".296" = zext i1 %".295" to i32
  ;  Source: b
  %"b.18" = load i32, i32* %"b"
  ;  Source: d
  %"d.7" = load i32, i32* %"d"
  %".299" = icmp eq i32 %"d.7", 0
  %".300" = zext i1 %".299" to i32
  ;  Source: (b&&!d)
  %".302" = icmp ne i32 %"b.18", 0
  %".303" = icmp ne i32 %".300", 0
  %".304" = and i1 %".302", %".303"
  %".305" = zext i1 %".304" to i32
  %".306" = icmp eq i32 %".305", 0
  %".307" = zext i1 %".306" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".309" = icmp ne i32 %".296", 0
  %".310" = icmp ne i32 %".307", 0
  %".311" = or i1 %".309", %".310"
  %".312" = zext i1 %".311" to i32
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".312", i32* %"f"
  %".315" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: f
  %"f.14" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".318" = call i32 (i8*, ...) @"printf"(i8* %".315", i32 %"f.14")
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
  %".333" = icmp ne i32 %"b.20", 0
  %".334" = icmp ne i32 %"c.12", 0
  %".335" = or i1 %".333", %".334"
  %".336" = zext i1 %".335" to i32
  %".337" = icmp eq i32 %".336", 0
  %".338" = zext i1 %".337" to i32
  %".339" = icmp ne i32 %"a.16", 0
  %".340" = icmp ne i32 %".338", 0
  %".341" = and i1 %".339", %".340"
  %".342" = zext i1 %".341" to i32
  ;  Source: b
  %"b.21" = load i32, i32* %"b"
  ;  Source: d
  %"d.8" = load i32, i32* %"d"
  %".345" = icmp eq i32 %"d.8", 0
  %".346" = zext i1 %".345" to i32
  ;  Source: (b&&!d)
  %".348" = icmp ne i32 %"b.21", 0
  %".349" = icmp ne i32 %".346", 0
  %".350" = and i1 %".348", %".349"
  %".351" = zext i1 %".350" to i32
  %".352" = icmp eq i32 %".351", 0
  %".353" = zext i1 %".352" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".355" = icmp ne i32 %".342", 0
  %".356" = icmp ne i32 %".353", 0
  %".357" = or i1 %".355", %".356"
  %".358" = zext i1 %".357" to i32
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".358", i32* %"f"
  %".361" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: f
  %"f.16" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".364" = call i32 (i8*, ...) @"printf"(i8* %".361", i32 %"f.16")
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
  %".379" = icmp ne i32 %"b.23", 0
  %".380" = icmp ne i32 %"c.14", 0
  %".381" = or i1 %".379", %".380"
  %".382" = zext i1 %".381" to i32
  %".383" = icmp eq i32 %".382", 0
  %".384" = zext i1 %".383" to i32
  %".385" = icmp ne i32 %"a.18", 0
  %".386" = icmp ne i32 %".384", 0
  %".387" = and i1 %".385", %".386"
  %".388" = zext i1 %".387" to i32
  ;  Source: b
  %"b.24" = load i32, i32* %"b"
  ;  Source: d
  %"d.9" = load i32, i32* %"d"
  %".391" = icmp eq i32 %"d.9", 0
  %".392" = zext i1 %".391" to i32
  ;  Source: (b&&!d)
  %".394" = icmp ne i32 %"b.24", 0
  %".395" = icmp ne i32 %".392", 0
  %".396" = and i1 %".394", %".395"
  %".397" = zext i1 %".396" to i32
  %".398" = icmp eq i32 %".397", 0
  %".399" = zext i1 %".398" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".401" = icmp ne i32 %".388", 0
  %".402" = icmp ne i32 %".399", 0
  %".403" = or i1 %".401", %".402"
  %".404" = zext i1 %".403" to i32
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".404", i32* %"f"
  %".407" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: f
  %"f.18" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".410" = call i32 (i8*, ...) @"printf"(i8* %".407", i32 %"f.18")
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