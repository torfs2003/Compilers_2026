; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

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
  %".155" = icmp ne i32 %"b.8", 0
  %".156" = icmp ne i32 %"c.5", 0
  %".157" = or i1 %".155", %".156"
  %".158" = zext i1 %".157" to i32
  %".159" = icmp eq i32 %".158", 0
  %".160" = zext i1 %".159" to i32
  %".161" = icmp ne i32 %"a.8", 0
  %".162" = icmp ne i32 %".160", 0
  %".163" = and i1 %".161", %".162"
  %".164" = zext i1 %".163" to i32
  ;  Source: b
  %"b.9" = load i32, i32* %"b"
  ;  Source: d
  %"d.5" = load i32, i32* %"d"
  %".167" = icmp eq i32 %"d.5", 0
  %".168" = zext i1 %".167" to i32
  ;  Source: (b&&!d)
  %".170" = icmp ne i32 %"b.9", 0
  %".171" = icmp ne i32 %".168", 0
  %".172" = and i1 %".170", %".171"
  %".173" = zext i1 %".172" to i32
  %".174" = icmp eq i32 %".173", 0
  %".175" = zext i1 %".174" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".177" = icmp ne i32 %".164", 0
  %".178" = icmp ne i32 %".175", 0
  %".179" = or i1 %".177", %".178"
  %".180" = zext i1 %".179" to i32
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".180", i32* %"f"
  %".183" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: f
  %"f.8" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".186" = call i32 (i8*, ...) @"printf"(i8* %".183", i32 %"f.8")
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
  %".198" = icmp ne i32 %"b.11", 0
  %".199" = icmp ne i32 %"c.6", 0
  %".200" = or i1 %".198", %".199"
  %".201" = zext i1 %".200" to i32
  %".202" = icmp eq i32 %".201", 0
  %".203" = zext i1 %".202" to i32
  %".204" = icmp ne i32 %"a.10", 0
  %".205" = icmp ne i32 %".203", 0
  %".206" = and i1 %".204", %".205"
  %".207" = zext i1 %".206" to i32
  ;  Source: b
  %"b.12" = load i32, i32* %"b"
  ;  Source: d
  %"d.6" = load i32, i32* %"d"
  %".210" = icmp eq i32 %"d.6", 0
  %".211" = zext i1 %".210" to i32
  ;  Source: (b&&!d)
  %".213" = icmp ne i32 %"b.12", 0
  %".214" = icmp ne i32 %".211", 0
  %".215" = and i1 %".213", %".214"
  %".216" = zext i1 %".215" to i32
  %".217" = icmp eq i32 %".216", 0
  %".218" = zext i1 %".217" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".220" = icmp ne i32 %".207", 0
  %".221" = icmp ne i32 %".218", 0
  %".222" = or i1 %".220", %".221"
  %".223" = zext i1 %".222" to i32
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".223", i32* %"f"
  %".226" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: f
  %"f.10" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".229" = call i32 (i8*, ...) @"printf"(i8* %".226", i32 %"f.10")
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
  %".244" = icmp ne i32 %"b.14", 0
  %".245" = icmp ne i32 %"c.8", 0
  %".246" = or i1 %".244", %".245"
  %".247" = zext i1 %".246" to i32
  %".248" = icmp eq i32 %".247", 0
  %".249" = zext i1 %".248" to i32
  %".250" = icmp ne i32 %"a.12", 0
  %".251" = icmp ne i32 %".249", 0
  %".252" = and i1 %".250", %".251"
  %".253" = zext i1 %".252" to i32
  ;  Source: b
  %"b.15" = load i32, i32* %"b"
  ;  Source: d
  %"d.7" = load i32, i32* %"d"
  %".256" = icmp eq i32 %"d.7", 0
  %".257" = zext i1 %".256" to i32
  ;  Source: (b&&!d)
  %".259" = icmp ne i32 %"b.15", 0
  %".260" = icmp ne i32 %".257", 0
  %".261" = and i1 %".259", %".260"
  %".262" = zext i1 %".261" to i32
  %".263" = icmp eq i32 %".262", 0
  %".264" = zext i1 %".263" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".266" = icmp ne i32 %".253", 0
  %".267" = icmp ne i32 %".264", 0
  %".268" = or i1 %".266", %".267"
  %".269" = zext i1 %".268" to i32
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".269", i32* %"f"
  %".272" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: f
  %"f.12" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".275" = call i32 (i8*, ...) @"printf"(i8* %".272", i32 %"f.12")
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
  %".290" = icmp ne i32 %"b.17", 0
  %".291" = icmp ne i32 %"c.10", 0
  %".292" = or i1 %".290", %".291"
  %".293" = zext i1 %".292" to i32
  %".294" = icmp eq i32 %".293", 0
  %".295" = zext i1 %".294" to i32
  %".296" = icmp ne i32 %"a.14", 0
  %".297" = icmp ne i32 %".295", 0
  %".298" = and i1 %".296", %".297"
  %".299" = zext i1 %".298" to i32
  ;  Source: b
  %"b.18" = load i32, i32* %"b"
  ;  Source: d
  %"d.8" = load i32, i32* %"d"
  %".302" = icmp eq i32 %"d.8", 0
  %".303" = zext i1 %".302" to i32
  ;  Source: (b&&!d)
  %".305" = icmp ne i32 %"b.18", 0
  %".306" = icmp ne i32 %".303", 0
  %".307" = and i1 %".305", %".306"
  %".308" = zext i1 %".307" to i32
  %".309" = icmp eq i32 %".308", 0
  %".310" = zext i1 %".309" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".312" = icmp ne i32 %".299", 0
  %".313" = icmp ne i32 %".310", 0
  %".314" = or i1 %".312", %".313"
  %".315" = zext i1 %".314" to i32
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".315", i32* %"f"
  %".318" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: f
  %"f.14" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".321" = call i32 (i8*, ...) @"printf"(i8* %".318", i32 %"f.14")
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
  %".336" = icmp ne i32 %"b.20", 0
  %".337" = icmp ne i32 %"c.12", 0
  %".338" = or i1 %".336", %".337"
  %".339" = zext i1 %".338" to i32
  %".340" = icmp eq i32 %".339", 0
  %".341" = zext i1 %".340" to i32
  %".342" = icmp ne i32 %"a.16", 0
  %".343" = icmp ne i32 %".341", 0
  %".344" = and i1 %".342", %".343"
  %".345" = zext i1 %".344" to i32
  ;  Source: b
  %"b.21" = load i32, i32* %"b"
  ;  Source: d
  %"d.9" = load i32, i32* %"d"
  %".348" = icmp eq i32 %"d.9", 0
  %".349" = zext i1 %".348" to i32
  ;  Source: (b&&!d)
  %".351" = icmp ne i32 %"b.21", 0
  %".352" = icmp ne i32 %".349", 0
  %".353" = and i1 %".351", %".352"
  %".354" = zext i1 %".353" to i32
  %".355" = icmp eq i32 %".354", 0
  %".356" = zext i1 %".355" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".358" = icmp ne i32 %".345", 0
  %".359" = icmp ne i32 %".356", 0
  %".360" = or i1 %".358", %".359"
  %".361" = zext i1 %".360" to i32
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".361", i32* %"f"
  %".364" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: f
  %"f.16" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".367" = call i32 (i8*, ...) @"printf"(i8* %".364", i32 %"f.16")
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
  %".382" = icmp ne i32 %"b.23", 0
  %".383" = icmp ne i32 %"c.14", 0
  %".384" = or i1 %".382", %".383"
  %".385" = zext i1 %".384" to i32
  %".386" = icmp eq i32 %".385", 0
  %".387" = zext i1 %".386" to i32
  %".388" = icmp ne i32 %"a.18", 0
  %".389" = icmp ne i32 %".387", 0
  %".390" = and i1 %".388", %".389"
  %".391" = zext i1 %".390" to i32
  ;  Source: b
  %"b.24" = load i32, i32* %"b"
  ;  Source: d
  %"d.10" = load i32, i32* %"d"
  %".394" = icmp eq i32 %"d.10", 0
  %".395" = zext i1 %".394" to i32
  ;  Source: (b&&!d)
  %".397" = icmp ne i32 %"b.24", 0
  %".398" = icmp ne i32 %".395", 0
  %".399" = and i1 %".397", %".398"
  %".400" = zext i1 %".399" to i32
  %".401" = icmp eq i32 %".400", 0
  %".402" = zext i1 %".401" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".404" = icmp ne i32 %".391", 0
  %".405" = icmp ne i32 %".402", 0
  %".406" = or i1 %".404", %".405"
  %".407" = zext i1 %".406" to i32
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".407", i32* %"f"
  %".410" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: f
  %"f.18" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".413" = call i32 (i8*, ...) @"printf"(i8* %".410", i32 %"f.18")
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