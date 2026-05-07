; ModuleID = "cmm_module"
target triple = "x86_64-w64-windows-gnu"
target datalayout = ""

declare i32 @"printf"(i8* %".1", ...)

declare i32 @"scanf"(i8* %".1", ...)

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
  ;  Source: (a&&!(b||c))
  %".35" = icmp ne i32 %"a.2", 0
  %".36" = icmp ne i32 %".33", 0
  %".37" = and i1 %".35", %".36"
  %".38" = zext i1 %".37" to i32
  ;  Source: f=(a&&!(b||c));
  store i32 %".38", i32* %"f"
  %".41" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f
  %"f.2" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".44" = call i32 (i8*, ...) @"printf"(i8* %".41", i32 %"f.2")
  ;  Source: b
  %"b.3" = load i32, i32* %"b"
  ;  Source: b=1;
  store i32 1, i32* %"b"
  ;  Source: f
  %"f.3" = load i32, i32* %"f"
  ;  Source: a
  %"a.3" = load i32, i32* %"a"
  ;  Source: b
  %"b.4" = load i32, i32* %"b"
  ;  Source: c
  %"c.3" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".53" = icmp ne i32 %"b.4", 0
  %".54" = icmp ne i32 %"c.3", 0
  %".55" = or i1 %".53", %".54"
  %".56" = zext i1 %".55" to i32
  %".57" = icmp eq i32 %".56", 0
  %".58" = zext i1 %".57" to i32
  ;  Source: (a&&!(b||c))
  %".60" = icmp ne i32 %"a.3", 0
  %".61" = icmp ne i32 %".58", 0
  %".62" = and i1 %".60", %".61"
  %".63" = zext i1 %".62" to i32
  ;  Source: f=(a&&!(b||c));
  store i32 %".63", i32* %"f"
  %".66" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: f
  %"f.4" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".69" = call i32 (i8*, ...) @"printf"(i8* %".66", i32 %"f.4")
  ;  Source: a
  %"a.4" = load i32, i32* %"a"
  ;  Source: a=1;
  store i32 1, i32* %"a"
  ;  Source: f
  %"f.5" = load i32, i32* %"f"
  ;  Source: a
  %"a.5" = load i32, i32* %"a"
  ;  Source: b
  %"b.5" = load i32, i32* %"b"
  ;  Source: c
  %"c.4" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".78" = icmp ne i32 %"b.5", 0
  %".79" = icmp ne i32 %"c.4", 0
  %".80" = or i1 %".78", %".79"
  %".81" = zext i1 %".80" to i32
  %".82" = icmp eq i32 %".81", 0
  %".83" = zext i1 %".82" to i32
  ;  Source: (a&&!(b||c))
  %".85" = icmp ne i32 %"a.5", 0
  %".86" = icmp ne i32 %".83", 0
  %".87" = and i1 %".85", %".86"
  %".88" = zext i1 %".87" to i32
  ;  Source: f=(a&&!(b||c));
  store i32 %".88", i32* %"f"
  %".91" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: f
  %"f.6" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".94" = call i32 (i8*, ...) @"printf"(i8* %".91", i32 %"f.6")
  ;  Source: b
  %"b.6" = load i32, i32* %"b"
  ;  Source: b=0;
  store i32 0, i32* %"b"
  ;  Source: f
  %"f.7" = load i32, i32* %"f"
  ;  Source: a
  %"a.6" = load i32, i32* %"a"
  ;  Source: b
  %"b.7" = load i32, i32* %"b"
  ;  Source: c
  %"c.5" = load i32, i32* %"c"
  ;  Source: (b||c)
  %".103" = icmp ne i32 %"b.7", 0
  %".104" = icmp ne i32 %"c.5", 0
  %".105" = or i1 %".103", %".104"
  %".106" = zext i1 %".105" to i32
  %".107" = icmp eq i32 %".106", 0
  %".108" = zext i1 %".107" to i32
  ;  Source: (a&&!(b||c))
  %".110" = icmp ne i32 %"a.6", 0
  %".111" = icmp ne i32 %".108", 0
  %".112" = and i1 %".110", %".111"
  %".113" = zext i1 %".112" to i32
  ;  Source: f=(a&&!(b||c));
  store i32 %".113", i32* %"f"
  %".116" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: f
  %"f.8" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".119" = call i32 (i8*, ...) @"printf"(i8* %".116", i32 %"f.8")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"