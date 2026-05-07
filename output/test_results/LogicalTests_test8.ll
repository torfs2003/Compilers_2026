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
  ;  Source: (a&&!(b||c))
  %".41" = icmp ne i32 %"a.2", 0
  %".42" = icmp ne i32 %".39", 0
  %".43" = and i1 %".41", %".42"
  %".44" = zext i1 %".43" to i32
  ;  Source: f=(a&&!(b||c));
  store i32 %".44", i32* %"f"
  %".47" = bitcast [3 x i8]* @"str" to i8*
  ;  Source: f
  %"f.2" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".50" = call i32 (i8*, ...) @"printf"(i8* %".47", i32 %"f.2")
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
  %".59" = icmp ne i32 %"b.4", 0
  %".60" = icmp ne i32 %"c.3", 0
  %".61" = or i1 %".59", %".60"
  %".62" = zext i1 %".61" to i32
  %".63" = icmp eq i32 %".62", 0
  %".64" = zext i1 %".63" to i32
  ;  Source: (a&&!(b||c))
  %".66" = icmp ne i32 %"a.3", 0
  %".67" = icmp ne i32 %".64", 0
  %".68" = and i1 %".66", %".67"
  %".69" = zext i1 %".68" to i32
  ;  Source: f=(a&&!(b||c));
  store i32 %".69", i32* %"f"
  %".72" = bitcast [3 x i8]* @"str.1" to i8*
  ;  Source: f
  %"f.4" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".75" = call i32 (i8*, ...) @"printf"(i8* %".72", i32 %"f.4")
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
  %".84" = icmp ne i32 %"b.5", 0
  %".85" = icmp ne i32 %"c.4", 0
  %".86" = or i1 %".84", %".85"
  %".87" = zext i1 %".86" to i32
  %".88" = icmp eq i32 %".87", 0
  %".89" = zext i1 %".88" to i32
  ;  Source: (a&&!(b||c))
  %".91" = icmp ne i32 %"a.5", 0
  %".92" = icmp ne i32 %".89", 0
  %".93" = and i1 %".91", %".92"
  %".94" = zext i1 %".93" to i32
  ;  Source: f=(a&&!(b||c));
  store i32 %".94", i32* %"f"
  %".97" = bitcast [3 x i8]* @"str.2" to i8*
  ;  Source: f
  %"f.6" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".100" = call i32 (i8*, ...) @"printf"(i8* %".97", i32 %"f.6")
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
  %".109" = icmp ne i32 %"b.7", 0
  %".110" = icmp ne i32 %"c.5", 0
  %".111" = or i1 %".109", %".110"
  %".112" = zext i1 %".111" to i32
  %".113" = icmp eq i32 %".112", 0
  %".114" = zext i1 %".113" to i32
  ;  Source: (a&&!(b||c))
  %".116" = icmp ne i32 %"a.6", 0
  %".117" = icmp ne i32 %".114", 0
  %".118" = and i1 %".116", %".117"
  %".119" = zext i1 %".118" to i32
  ;  Source: f=(a&&!(b||c));
  store i32 %".119", i32* %"f"
  %".122" = bitcast [3 x i8]* @"str.3" to i8*
  ;  Source: f
  %"f.8" = load i32, i32* %"f"
  ;  Source: printf("%d",f);
  %".125" = call i32 (i8*, ...) @"printf"(i8* %".122", i32 %"f.8")
  ;  Source: return0;
  ret i32 0
}

@"str" = internal constant [3 x i8] c"%d\00"
@"str.1" = internal constant [3 x i8] c"%d\00"
@"str.2" = internal constant [3 x i8] c"%d\00"
@"str.3" = internal constant [3 x i8] c"%d\00"