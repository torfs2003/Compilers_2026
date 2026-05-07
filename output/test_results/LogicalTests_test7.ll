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
  ;  Source: (a&&(b||c))
  %".36" = and i32 %"a.2", %".34"
  ;  Source: d
  %"d.2" = load i32, i32* %"d"
  ;  Source: c
  %"c.3" = load i32, i32* %"c"
  ;  Source: (d&&c)
  %".40" = and i32 %"d.2", %"c.3"
  ;  Source: e
  %"e.2" = load i32, i32* %"e"
  %".42" = and i32 %".40", %"e.2"
  ;  Source: (a&&(b||c))||(d&&c)&&e
  %".44" = or i32 %".36", %".42"
  ;  Source: f=(a&&(b||c))||(d&&c)&&e;
  store i32 %".44", i32* %"f"
  %".47" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f
  %"f.2" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".50" = call i32 (i8*, ...) @"printf"(i8* %".47", i32 %"f.2")
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
  %".59" = or i32 %"b.3", %"c.4"
  ;  Source: (a&&(b||c))
  %".61" = and i32 %"a.4", %".59"
  ;  Source: d
  %"d.3" = load i32, i32* %"d"
  ;  Source: c
  %"c.5" = load i32, i32* %"c"
  ;  Source: (d&&c)
  %".65" = and i32 %"d.3", %"c.5"
  ;  Source: e
  %"e.3" = load i32, i32* %"e"
  %".67" = and i32 %".65", %"e.3"
  ;  Source: (a&&(b||c))||(d&&c)&&e
  %".69" = or i32 %".61", %".67"
  ;  Source: f=(a&&(b||c))||(d&&c)&&e;
  store i32 %".69", i32* %"f"
  %".72" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: f
  %"f.4" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".75" = call i32 (i8*, ...) @"printf"(i8* %".72", i32 %"f.4")
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
  %".84" = or i32 %"b.5", %"c.6"
  ;  Source: (a&&(b||c))
  %".86" = and i32 %"a.5", %".84"
  ;  Source: d
  %"d.4" = load i32, i32* %"d"
  ;  Source: c
  %"c.7" = load i32, i32* %"c"
  ;  Source: (d&&c)
  %".90" = and i32 %"d.4", %"c.7"
  ;  Source: e
  %"e.4" = load i32, i32* %"e"
  %".92" = and i32 %".90", %"e.4"
  ;  Source: (a&&(b||c))||(d&&c)&&e
  %".94" = or i32 %".86", %".92"
  ;  Source: f=(a&&(b||c))||(d&&c)&&e;
  store i32 %".94", i32* %"f"
  %".97" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: f
  %"f.6" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".100" = call i32 (i8*, ...) @"printf"(i8* %".97", i32 %"f.6")
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
  %".109" = or i32 %"b.6", %"c.9"
  ;  Source: (a&&(b||c))
  %".111" = and i32 %"a.6", %".109"
  ;  Source: d
  %"d.5" = load i32, i32* %"d"
  ;  Source: c
  %"c.10" = load i32, i32* %"c"
  ;  Source: (d&&c)
  %".115" = and i32 %"d.5", %"c.10"
  ;  Source: e
  %"e.5" = load i32, i32* %"e"
  %".117" = and i32 %".115", %"e.5"
  ;  Source: (a&&(b||c))||(d&&c)&&e
  %".119" = or i32 %".111", %".117"
  ;  Source: f=(a&&(b||c))||(d&&c)&&e;
  store i32 %".119", i32* %"f"
  %".122" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: f
  %"f.8" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".125" = call i32 (i8*, ...) @"printf"(i8* %".122", i32 %"f.8")
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
  %".134" = or i32 %"b.7", %"c.11"
  ;  Source: (a&&(b||c))
  %".136" = and i32 %"a.7", %".134"
  ;  Source: d
  %"d.7" = load i32, i32* %"d"
  ;  Source: c
  %"c.12" = load i32, i32* %"c"
  ;  Source: (d&&c)
  %".140" = and i32 %"d.7", %"c.12"
  ;  Source: e
  %"e.6" = load i32, i32* %"e"
  %".142" = and i32 %".140", %"e.6"
  ;  Source: (a&&(b||c))||(d&&c)&&e
  %".144" = or i32 %".136", %".142"
  ;  Source: f=(a&&(b||c))||(d&&c)&&e;
  store i32 %".144", i32* %"f"
  %".147" = bitcast [3 x i8]* @"str.4" to i8*
  ;  Source: f
  %"f.10" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".150" = call i32 (i8*, ...) @"printf"(i8* %".147", i32 %"f.10")
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
  %".159" = or i32 %"b.8", %"c.13"
  ;  Source: (a&&(b||c))
  %".161" = and i32 %"a.8", %".159"
  ;  Source: d
  %"d.8" = load i32, i32* %"d"
  ;  Source: c
  %"c.14" = load i32, i32* %"c"
  ;  Source: (d&&c)
  %".165" = and i32 %"d.8", %"c.14"
  ;  Source: e
  %"e.8" = load i32, i32* %"e"
  %".167" = and i32 %".165", %"e.8"
  ;  Source: (a&&(b||c))||(d&&c)&&e
  %".169" = or i32 %".161", %".167"
  ;  Source: f=(a&&(b||c))||(d&&c)&&e;
  store i32 %".169", i32* %"f"
  %".172" = bitcast [3 x i8]* @"str.5" to i8*
  ;  Source: f
  %"f.12" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".175" = call i32 (i8*, ...) @"printf"(i8* %".172", i32 %"f.12")
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
  %".184" = or i32 %"b.10", %"c.15"
  ;  Source: (a&&(b||c))
  %".186" = and i32 %"a.9", %".184"
  ;  Source: d
  %"d.9" = load i32, i32* %"d"
  ;  Source: c
  %"c.16" = load i32, i32* %"c"
  ;  Source: (d&&c)
  %".190" = and i32 %"d.9", %"c.16"
  ;  Source: e
  %"e.9" = load i32, i32* %"e"
  %".192" = and i32 %".190", %"e.9"
  ;  Source: (a&&(b||c))||(d&&c)&&e
  %".194" = or i32 %".186", %".192"
  ;  Source: f=(a&&(b||c))||(d&&c)&&e;
  store i32 %".194", i32* %"f"
  %".197" = bitcast [3 x i8]* @"str.6" to i8*
  ;  Source: f
  %"f.14" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".200" = call i32 (i8*, ...) @"printf"(i8* %".197", i32 %"f.14")
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
  %".209" = or i32 %"b.11", %"c.18"
  ;  Source: (a&&(b||c))
  %".211" = and i32 %"a.10", %".209"
  ;  Source: d
  %"d.10" = load i32, i32* %"d"
  ;  Source: c
  %"c.19" = load i32, i32* %"c"
  ;  Source: (d&&c)
  %".215" = and i32 %"d.10", %"c.19"
  ;  Source: e
  %"e.10" = load i32, i32* %"e"
  %".217" = and i32 %".215", %"e.10"
  ;  Source: (a&&(b||c))||(d&&c)&&e
  %".219" = or i32 %".211", %".217"
  ;  Source: f=(a&&(b||c))||(d&&c)&&e;
  store i32 %".219", i32* %"f"
  %".222" = bitcast [3 x i8]* @"str.7" to i8*
  ;  Source: f
  %"f.16" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".225" = call i32 (i8*, ...) @"printf"(i8* %".222", i32 %"f.16")
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
  %".234" = or i32 %"b.12", %"c.20"
  ;  Source: (a&&(b||c))
  %".236" = and i32 %"a.11", %".234"
  ;  Source: d
  %"d.12" = load i32, i32* %"d"
  ;  Source: c
  %"c.21" = load i32, i32* %"c"
  ;  Source: (d&&c)
  %".240" = and i32 %"d.12", %"c.21"
  ;  Source: e
  %"e.11" = load i32, i32* %"e"
  %".242" = and i32 %".240", %"e.11"
  ;  Source: (a&&(b||c))||(d&&c)&&e
  %".244" = or i32 %".236", %".242"
  ;  Source: f=(a&&(b||c))||(d&&c)&&e;
  store i32 %".244", i32* %"f"
  %".247" = bitcast [3 x i8]* @"str.8" to i8*
  ;  Source: f
  %"f.18" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".250" = call i32 (i8*, ...) @"printf"(i8* %".247", i32 %"f.18")
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