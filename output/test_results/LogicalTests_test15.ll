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
  %".34" = or i32 %"b.2", %"c.2"
  %".35" = icmp eq i32 %".34", 0
  %".36" = zext i1 %".35" to i32
  %".37" = and i32 %"a.2", %".36"
  ;  Source: b
  %"b.3" = load i32, i32* %"b"
  ;  Source: d
  %"d.2" = load i32, i32* %"d"
  %".40" = icmp eq i32 %"d.2", 0
  %".41" = zext i1 %".40" to i32
  %".42" = and i32 %"b.3", %".41"
  ;  Source: e
  %"e.2" = load i32, i32* %"e"
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  %".45" = icmp eq i32 %"a.3", 0
  %".46" = zext i1 %".45" to i32
  ;  Source: (e&&!a)
  %".48" = and i32 %"e.2", %".46"
  ;  Source: (b&&!d||(e&&!a))
  %".50" = or i32 %".42", %".48"
  %".51" = icmp eq i32 %".50", 0
  %".52" = zext i1 %".51" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d||(e&&!a)))
  %".54" = or i32 %".37", %".52"
  ;  Source: f=(a&&!(b||c)||!(b&&!d||(e&&!a)));
  store i32 %".54", i32* %"f"
  %".57" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f
  %"f.2" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".60" = call i32 (i8*, ...) @"printf"(i8* %".57", i32 %"f.2")
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
  %".69" = or i32 %"b.4", %"c.3"
  %".70" = icmp eq i32 %".69", 0
  %".71" = zext i1 %".70" to i32
  ;  Source: (a&&!(b||c))
  %".73" = and i32 %"a.5", %".71"
  ;  Source: f=(a&&!(b||c));
  store i32 %".73", i32* %"f"
  %".76" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: f
  %"f.4" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".79" = call i32 (i8*, ...) @"printf"(i8* %".76", i32 %"f.4")
  ;  Source: f
  %"f.5" = load i32, i32* %"f"
  ;  Source: a
  %"a.6" = load i32, i32* %"a"
  ;  Source: b
  %"b.5" = load i32, i32* %"b"
  ;  Source: c
  %"c.4" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".85" = or i32 %"b.5", %"c.4"
  %".86" = icmp eq i32 %".85", 0
  %".87" = zext i1 %".86" to i32
  %".88" = and i32 %"a.6", %".87"
  ;  Source: b
  %"b.6" = load i32, i32* %"b"
  ;  Source: d
  %"d.3" = load i32, i32* %"d"
  %".91" = icmp eq i32 %"d.3", 0
  %".92" = zext i1 %".91" to i32
  ;  Source: (b&&!d)
  %".94" = and i32 %"b.6", %".92"
  %".95" = icmp eq i32 %".94", 0
  %".96" = zext i1 %".95" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".98" = or i32 %".88", %".96"
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".98", i32* %"f"
  %".101" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: f
  %"f.6" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".104" = call i32 (i8*, ...) @"printf"(i8* %".101", i32 %"f.6")
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
  %".119" = or i32 %"b.8", %"c.5"
  %".120" = icmp eq i32 %".119", 0
  %".121" = zext i1 %".120" to i32
  %".122" = and i32 %"a.8", %".121"
  ;  Source: b
  %"b.9" = load i32, i32* %"b"
  ;  Source: d
  %"d.5" = load i32, i32* %"d"
  %".125" = icmp eq i32 %"d.5", 0
  %".126" = zext i1 %".125" to i32
  ;  Source: (b&&!d)
  %".128" = and i32 %"b.9", %".126"
  %".129" = icmp eq i32 %".128", 0
  %".130" = zext i1 %".129" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".132" = or i32 %".122", %".130"
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".132", i32* %"f"
  %".135" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: f
  %"f.8" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".138" = call i32 (i8*, ...) @"printf"(i8* %".135", i32 %"f.8")
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
  %".150" = or i32 %"b.11", %"c.6"
  %".151" = icmp eq i32 %".150", 0
  %".152" = zext i1 %".151" to i32
  %".153" = and i32 %"a.10", %".152"
  ;  Source: b
  %"b.12" = load i32, i32* %"b"
  ;  Source: d
  %"d.6" = load i32, i32* %"d"
  %".156" = icmp eq i32 %"d.6", 0
  %".157" = zext i1 %".156" to i32
  ;  Source: (b&&!d)
  %".159" = and i32 %"b.12", %".157"
  %".160" = icmp eq i32 %".159", 0
  %".161" = zext i1 %".160" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".163" = or i32 %".153", %".161"
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".163", i32* %"f"
  %".166" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: f
  %"f.10" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".169" = call i32 (i8*, ...) @"printf"(i8* %".166", i32 %"f.10")
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
  %".184" = or i32 %"b.14", %"c.8"
  %".185" = icmp eq i32 %".184", 0
  %".186" = zext i1 %".185" to i32
  %".187" = and i32 %"a.12", %".186"
  ;  Source: b
  %"b.15" = load i32, i32* %"b"
  ;  Source: d
  %"d.7" = load i32, i32* %"d"
  %".190" = icmp eq i32 %"d.7", 0
  %".191" = zext i1 %".190" to i32
  ;  Source: (b&&!d)
  %".193" = and i32 %"b.15", %".191"
  %".194" = icmp eq i32 %".193", 0
  %".195" = zext i1 %".194" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".197" = or i32 %".187", %".195"
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".197", i32* %"f"
  %".200" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: f
  %"f.12" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".203" = call i32 (i8*, ...) @"printf"(i8* %".200", i32 %"f.12")
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
  %".218" = or i32 %"b.17", %"c.10"
  %".219" = icmp eq i32 %".218", 0
  %".220" = zext i1 %".219" to i32
  %".221" = and i32 %"a.14", %".220"
  ;  Source: b
  %"b.18" = load i32, i32* %"b"
  ;  Source: d
  %"d.8" = load i32, i32* %"d"
  %".224" = icmp eq i32 %"d.8", 0
  %".225" = zext i1 %".224" to i32
  ;  Source: (b&&!d)
  %".227" = and i32 %"b.18", %".225"
  %".228" = icmp eq i32 %".227", 0
  %".229" = zext i1 %".228" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".231" = or i32 %".221", %".229"
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".231", i32* %"f"
  %".234" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: f
  %"f.14" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".237" = call i32 (i8*, ...) @"printf"(i8* %".234", i32 %"f.14")
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
  %".252" = or i32 %"b.20", %"c.12"
  %".253" = icmp eq i32 %".252", 0
  %".254" = zext i1 %".253" to i32
  %".255" = and i32 %"a.16", %".254"
  ;  Source: b
  %"b.21" = load i32, i32* %"b"
  ;  Source: d
  %"d.9" = load i32, i32* %"d"
  %".258" = icmp eq i32 %"d.9", 0
  %".259" = zext i1 %".258" to i32
  ;  Source: (b&&!d)
  %".261" = and i32 %"b.21", %".259"
  %".262" = icmp eq i32 %".261", 0
  %".263" = zext i1 %".262" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".265" = or i32 %".255", %".263"
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".265", i32* %"f"
  %".268" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: f
  %"f.16" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".271" = call i32 (i8*, ...) @"printf"(i8* %".268", i32 %"f.16")
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
  %".286" = or i32 %"b.23", %"c.14"
  %".287" = icmp eq i32 %".286", 0
  %".288" = zext i1 %".287" to i32
  %".289" = and i32 %"a.18", %".288"
  ;  Source: b
  %"b.24" = load i32, i32* %"b"
  ;  Source: d
  %"d.10" = load i32, i32* %"d"
  %".292" = icmp eq i32 %"d.10", 0
  %".293" = zext i1 %".292" to i32
  ;  Source: (b&&!d)
  %".295" = and i32 %"b.24", %".293"
  %".296" = icmp eq i32 %".295", 0
  %".297" = zext i1 %".296" to i32
  ;  Source: (a&&!(b||c)||!(b&&!d))
  %".299" = or i32 %".289", %".297"
  ;  Source: f=(a&&!(b||c)||!(b&&!d));
  store i32 %".299", i32* %"f"
  %".302" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: f
  %"f.18" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".305" = call i32 (i8*, ...) @"printf"(i8* %".302", i32 %"f.18")
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